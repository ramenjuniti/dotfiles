#!/bin/sh

set -e

if type fish >/dev/null 2>&1; then
	fish -c fisher
fi
