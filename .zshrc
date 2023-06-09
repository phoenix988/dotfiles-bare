##____  _                      _
#|  _ \| |__   ___   ___ _ __ (_)_  __
#| |_) | '_ \ / _ \ / _ \ '_ \| \ \/ /
#|  __/| | | | (_) |  __/ | | | |>  <
#|_|   |_| |_|\___/ \___|_| |_|_/_/\_\
#
# -*- coding: utf-8 -*-
# Path to your oh-my-zsh installation.
export ZSH="/home/karl/.config/oh-my-zsh"
#ZSH_THEME='nord'

export HISTCONTROL=ignoreboth:erasedups

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git )

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#Source the starship prompt
eval "$(starship init zsh)"


[ -f $HOME/.config/alias-zsh-bash ] && source $HOME/.config/alias-zsh-bash

#uwufetch
[ -f /usr/bin/pfetch ] && pfetch

alias sou="source ~/.zshrc"

add_myscripts="/home/karl/.scripts/activated"
myscripts_exist=$(echo $PATH | sed 's/:/\n/g' | grep $add_myscripts)
[ -z "$myscripts_exist" ] &&  PATH="$PATH:$add_myscripts"

add_dmenu="/home/karl/.dmenu"
dmenu_exist=$(echo $PATH | sed 's/:/\n/g' | grep $add_dmenu)
[ -z "$dmenu_exist" ] &&  PATH="$PATH:$add_dmenu"

add_doom="/home/karl/.config/emacs/bin/"
doom_exist=$(echo $PATH | sed 's/:/\n/g' | grep $add_doom)
[ -z "$doom_exist" ] &&  PATH="$PATH:$add_doom"




[ "$TERM" = "xterm-color" ] && export TERM=xterm-256color




source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $ZSH/zsh-vim-mode/zsh-vim-mode.plugin.zsh


bindkey '^ ' autosuggest-accept


ZSH_HIGHLIGHT_STYLES[default]='fg=3'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=5,underline'
ZSH_HIGHLIGHT_STYLES[command]='fg=4'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=6'
ZSH_HIGHLIGHT_STYLES[alias]='fg=4'
ZSH_HIGHLIGHT_STYLES[path]='fg=5'

ex ()

{
 if [ -f "$1" ]; then 
     case $1 in
         *.tar.bz2)   tar xjf  $1   ;;
         *.tar.gz)    tar xzf  $1   ;;
         *.bz2)       bunzip2  $1   ;;
         *.rar)       unrar x  $1   ;;
          *.gz)       gunzip   $1   ;;
         *.tar)       tar xf   $1   ;;
         *.tbz2)      tar xjf  $1   ;;
         *.tgz)       tar xzf  $1   ;;
         *.zip)       unzip    $1   ;;
         *.Z)         uncompress $1 ;;
         *.7z)        7z x     $1   ;;
         *.deb)       ar x     $1   ;;
         *.tar.zst)    unzstd  $1   ;;
         *.tar.xz)     tar xf  $1   ;;
         *)            echo "$1 Cannot be extracted vi ex()"
      esac
    else
       echo "$1 is not a valid file"
       fi  
}

date=$(date +%d-%h-%Y-%H-%M)

source ~/.config/fzf/rose-pine-moon.sh


