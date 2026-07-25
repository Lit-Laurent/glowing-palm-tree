#######################
## ZSH CONFIGURATION ##
#######################
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh" ## Path to Oh My Zsh installation
export STARSHIP_CONFIG=~/.config/starship/catppuccin.toml
zstyle ':omz:update' mode reminder  ## Reminder for to update (auto checks every fortnight :D)
plugins=(git archlinux colored-man-pages emoji starship)

source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export TERMINAL=kitty


#########
## ETC ##
#########
alias ff='kitty -c "$HOME/.config/kitty/ff.conf" -T Fastfetch "$HOME/.config/myScripts/ff/ff.sh" & disown'

## Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

## Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
## This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
