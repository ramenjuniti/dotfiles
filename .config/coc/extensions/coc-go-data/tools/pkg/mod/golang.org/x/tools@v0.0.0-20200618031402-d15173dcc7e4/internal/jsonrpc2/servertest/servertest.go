// Copyright 2020 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Package servertest provides utilities for running tests against a remote LSP
// server.
package servertest

import (
	"context"
	"fmt"
	"net"
	"strings"
	"sync"

	"golang.org/x/tools/internal/jsonrpc2"
)

// Connector is the interface used to connect to a server.
type Connector interface {
	Connect(context.Context) jsonrpc2.Conn
}

// TCPServer is a helper for executing tests against a remote jsonrpc2
// connection. Once initialized, its Addr field may be used to connect a
// jsonrpc2 client.
type TCPServer struct {
	Addr string

	ln     net.Listener
	framer jsonrpc2.Framer
	cls    *closerList
}

// NewTCPServer returns a new test server listening on local tcp port and
// serving incoming jsonrpc2 streams using the provided stream server. It
// panics on any error.
func NewTCPServer(ctx context.Context, server jsonrpc2.StreamServer, framer jsonrpc2.Framer) *TCPServer {
	ln, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		panic(fmt.Sprintf("servertest: failed to listen: %v", err))
	}
	if framer == nil {
		framer = jsonrpc2.NewHeaderStream
	}
	go jsonrpc2.Serve(ctx, ln, server, 0)
	return &TCPServer{Addr: ln.Addr().String(), ln: ln, framer: framer, cls: &closerList{}}
}

// Connect dials the test server and returns a jsonrpc2 Connection that is
// ready for use.
func (s *TCPServer) Connect(ctx context.Context) jsonrpc2.Conn {
	netConn, err := net.Dial("tcp", s.Addr)
	if err != nil {
		panic(fmt.Sprintf("servertest: failed to connect to test instance: %v", err))
	}
	conn := jsonrpc2.NewConn(s.framer(netConn))
	s.cls.add(conn.Close)
	return conn
}

// Close closes all server connections.
func (s *TCPServer) Close() error {
	return s.cls.Close()
}

// PipeServer is a test server that handles connections over io.Pipes.
type PipeServer struct {
	server jsonrpc2.StreamServer
	framer jsonrpc2.Framer
	cls    *closerList
}

// NewPipeServer returns a test server that can be connected to via io.Pipes.
func NewPipeServer(ctx context.Context, server jsonrpc2.StreamServer, framer jsonrpc2.Framer) *PipeServer {
	if framer == nil {
		framer = jsonrpc2.NewRawStream
	}
	return &PipeServer{server: server, framer: framer, cls: &closerList{}}
}

// Connect creates new io.Pipes and binds them to the underlying StreamServer.
func (s *PipeServer) Connect(ctx context.Context) jsonrpc2.Conn {
	sPipe, cPipe := net.Pipe()
	serverStream := s.framer(sPipe)
	serverConn := jsonrpc2.NewConn(serverStream)
	s.cls.add(serverConn.Close)
	go s.server.ServeStream(ctx, serverConn)

	clientStream := s.framer(cPipe)
	clientConn := jsonrpc2.NewConn(clientStream)
	s.cls.add(clientConn.Close)
	return clientConn
}

// Close closes all connected pipes.
func (s *PipeServer) Close() error {
	return s.cls.Close()
}

// closerList tracks closers to run when a testserver is closed.  This is a
// convenience, so that callers don't have to worry about closing each
// connection.
type closerList struct {
	mu      sync.Mutex
	closers []func() error
}

func (l *closerList) add(closer func() error) {
	l.mu.Lock()
	defer l.mu.Unlock()
	l.closers = append(l.closers, closer)
}

func (l *closerList) Close() error {
	l.mu.Lock()
	defer l.mu.Unlock()
	var errmsgs []string
	for _, closer := range l.closers {
		if err := closer(); err != nil {
			errmsgs = append(errmsgs, err.Error())
		}
	}
	if len(errmsgs) > 0 {
		return fmt.Errorf("closing errors:\n%s", strings.Join(errmsgs, "\n"))
	}
	return nil
}
