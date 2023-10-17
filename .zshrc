# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="$HOME/dotfiles/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ~/.bashrc
source /home/curz/miniconda3/etc/profile.d/conda.sh
export CLASSPATH=".:/home/curz/opt/lib/antlr-4.13.1-complete.jar:$CLASSPATH"
export PATH="/home/curz/opt/bin/:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"
export LD_LIBRARY_PATH=/usr/local/lib
alias cdw="cd /mnt/c/Users/theca/Documents/"
alias cdl="cd ~"

alias ls="lsd"
alias l="lsd -l"
alias la="lsd -a"
alias lla="ls -la"
alias lt="ls --tree"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
