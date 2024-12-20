if [[ "$(uname -s)" == "Linux" && -f "/etc/arch-release" ]]; then
	if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    hyprland 
  fi
fi
### Settings for Languages and Tools ###

# Zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then # Keep at the start of file
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="$HOME/dotfiles/bin:$PATH"
if [ -d "$HOME/Apps/" ]; then
	export PATH="$HOME/Apps:$PATH"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# If you've installed powerlevel10k manually:
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Or if you're using it through Oh My Zsh:
# ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Python
# Source conda
if [ -f "/home/curz/miniconda3/etc/profile.d/conda.sh" ]; then
    source "/home/curz/miniconda3/etc/profile.d/conda.sh"
fi
# Source pyenv
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Antlr4
export CLASSPATH=".:/home/curz/opt/lib/antlr-4.13.1-complete.jar:$CLASSPATH"

# Go
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Java
export PATH="/home/curz/opt/bin/:$PATH"
# export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# C/C++
#export LD_LIBRARY_PATH=/usr/local/lib # Workaround to make libs work
alias cpg="~/dotfiles/bin/cpg"

### Aliases ###

# WSL
alias cdw="cd /mnt/c/Users/theca/Documents/"
alias cdl="cd ~"

# LSD
alias ls="lsd"
alias l="lsd -l"
alias la="lsd -a"
alias lla="ls -la"
alias lt="ls --tree"

# Load configs
alias env_activate="source env/bin/activate"

# git
alias gc="git commit -m"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion.
if command -v ng &> /dev/null; then
    source <(ng completion script)
fi

# pnpm
export PNPM_HOME="/home/curz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
