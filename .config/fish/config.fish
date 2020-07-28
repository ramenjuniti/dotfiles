# env
# go
set -x GOPATH     $HOME/go
set -x PATH       $PATH $GOPATH/bin
# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH       $PATH $PYENV_ROOT/bin

# ~env
eval (nodenv init - | source)
eval (rbenv init - | source)
eval (pyenv init - | source)

# alias
alias vim=nvim

# fish keybinds
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \cg ghq_peco_repo
end

# ghq + peco
function ghq_peco_repo
  set selected_repository (ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_repository" ]
    cd $selected_repository
    echo " $selected_repository "
    commandline -f repaint
  end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ramenjuniti/google-cloud-sdk/path.fish.inc' ]; . '/Users/ramenjuniti/google-cloud-sdk/path.fish.inc'; end
