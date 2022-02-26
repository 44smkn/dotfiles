#!/bin/bash -ex

readonly SYMLINKS_FILES=(
    .zshrc
    .gitconfig
    .gitignore_global
    .aqua-global.yaml
)

setup() {
    local -r script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

    if [ ! -e $HOME/.gitconfig_local ]; then
        echo "type your git email address..."
        read line
        echo "[user]" >$HOME/.gitconfig_local
        echo "email = $line" >>$HOME/.gitconfig_local
    fi

    # Install brew if it does not exist
    command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew upgrade
    brew bundle --file ${script_dir}/Brewfile || true
    brew cleanup

    # Install oh-my-zsh if it does not exist
    [ ! -e "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # Install powerlevel10k if it does not exist
    [ ! -e "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    for file in ${SYMLINKS_FILES[@]}; do
        [ ! -e ${script_dir}/$file ] && ln -s ${script_dir}/$file $HOME/$file
    done

    source .zshrc
    aqua install -a
}

setup
