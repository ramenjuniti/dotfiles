# env
set -x GOPATH $HOME/go
set -x PATH   $PATH $GOPATH/bin
set -x PATH   $PATH $HOME/.nodebrew/current/bin

# alias
alias vim=nvim
alias python=python3
alias pip=pip3

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
