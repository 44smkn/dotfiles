export AQUA_GLOBAL_CONFIG=$HOME/.aqua-global.yaml
export AQUA_ROOT_DIR=$HOME/.local/aqua
export PATH=${AQUA_ROOT_DIR}/bin:$PATH
export DOTFILES=$HOME/dotfiles

source $DOTFILES/.zshrc.theme
source $DOTFILES/.zshrc.alias

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kenji.shimizu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kenji.shimizu/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kenji.shimizu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kenji.shimizu/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(rbenv init - zsh)"
