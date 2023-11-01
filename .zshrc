### Settings for Languages and Tools ###

# Zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then # Keep at the start of file
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="$HOME/dotfiles/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Python
source /home/curz/miniconda3/etc/profile.d/conda.sh

# Antlr4
export CLASSPATH=".:/home/curz/opt/lib/antlr-4.13.1-complete.jar:$CLASSPATH"

# Java
export PATH="/home/curz/opt/bin/:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"

# Nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# C/C++
export LD_LIBRARY_PATH=/usr/local/lib # Workaround to make libs work
alias gcp="~/dotfiles/bin/gcp"

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
