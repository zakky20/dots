# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-completions zsh-autosuggestions fast-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"

# Export
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/home/zak/.spicetify
export PATH="$HOME/.spicetify:$PATH"
export TERMINAL="alacritty"
export BROWSER="firefox"
export TERM="xterm-256color"
export EDITOR="nvim"

# Settings
setopt PROMPT_SUBST
setopt autocd
setopt interactive_comments
autoload -U compinit
autoload -U colors && colors	

# Path For .config
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# Path For .cache
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Countdown
cdown () {
    N=$1
  while [[ $((--N)) -gt  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}

# Function extract for common file formats
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Don't Delete
[[ $- != *i* ]] && return

# FastFetch
# fastfetch
pfetch

# Evals
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Package Manager Aliases
alias e="sudo emerge -va"
alias eu="sudo emerge -vauDU @world"
alias er="sudo emerge --deselect"
alias edp="sudo emerge --depclean"
alias es="sudo eix-sync"
alias disp="sudo dispatch-conf"
alias nws="sudo eselect news read"
alias est="sudo genlop -ci"

# Eza
alias ls="eza --color=always --icons=always"
alias la="eza -a --color=always --icons=always --group-directories-first"
alias ll="eza -l --color=always --icons=always --group-directories-first"
alias lt="eza -aT --color=always --icons=always --group-directories-first"
alias l.="eza -al --color=always --icons=always --group-directories-first ../"
alias l..="eza -al --color=always --icons=always --group-directories-first ../../"
alias l...="eza -al --color=always --icons=always --group-directories-first ../../../"

# Ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"

# Df, Free, Grep better
alias df="df -h"               
alias free="free -m"           
alias grep="grep --color=auto"

# Zoxide instead of cd 
alias cd="z"

# Bat instead of cat
alias cat="bat"

# Clear
alias c="clear"

# Neovim To Vim
alias vim="nvim"

# FastFetch
alias ff="fastfetch"

# Chmod X
alias cmx="sudo chmod +x"

# Compiling Alias
alias smi="sudo make install"
alias smci="sudo make clean install"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
