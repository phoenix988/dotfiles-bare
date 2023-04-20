#!/usr/bin/fish

function command_exist

   type "$1" &> /dev/null

end

# show ip
alias ipa="ifconfig | awk '/inet/ {print $2}' | head -n4"


# History alias
alias hg="history | grep"

# ls aliases use lsd if its available
if command_exist exa

alias ls='exa --color=auto'
alias la='exa -a'
alias lA='exa -A'
alias ll='exa -l'
alias lla='exa -la'
alias ld='exa -l | grep ^d'
alias l='exa'
alias l.="exa -A | egrep '^\.'"
alias hidden="exa -A | grep -v ^[A-Z] | grep -v ^[a-z]"


else

alias ls='ls --color=auto'
alias la='ls -a'
alias lA='ls -A'
alias ll='ls -l'
alias lla='ls -la'
alias ld='ls -l | grep ^d'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias hidden="ls -A | grep -v ^[A-Z] | grep -v ^[a-z]"

end

# btop alias if it's installed
if command_exist btop

alias htop='btop'


end

# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# readable output
alias df='df -h'
alias fsp="df -h | grep -v /var"


# free
alias free="free -mt"

# use all cores
alias uac="sh ~/.bin/main/000*"

# continue download
alias wget="wget -c"

# userlist
alias userlist="cut -d: -f1 /etc/passwd"

# merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
if command_exist apt

  if command_exist nala

   alias apt='sudo apt'
   alias update='sudo apt update && sudo apt upgrade'
   alias remove="sudo apt remove"
   alias nala="sudo apt"
   alias search="sudo apt search"
   alias install="sudo apt install"

  else

   alias apt='sudo nala'
   alias update='sudo nala update && sudo nala upgrade'
   alias remove="sudo nala remove"
   alias nala="sudo nala"
   alias search="sudo nala search"
   alias install="sudo nala install"
end

if command_exist batcat

   alias bat='batcat'
   alias cat='batcat'

end


elif command_exist pacman

    alias pacman="sudo pacman"
    alias update='sudo pacman -Syyu'
    alias remove="sudo pacman -Rns"

    # fix obvious typo's
    alias cd..='cd ..'
    alias pdw="pwd"
    alias udpate='sudo pacman -Syyu'
    alias upate='sudo pacman -Syyu'
    alias updte='sudo pacman -Syyu'
    alias updqte='sudo pacman -Syyu'
    alias upqll="paru -Syu --noconfirm"
 
    # pacman unlock
    alias unlock="sudo rm /var/lib/pacman/db.lck"
    alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
    

if command_exist bat

    # Change cat to bat
    alias cat='bat'
    alias norcat='/usr/bin/cat'
end
    # paru as aur helper - updates everything
    alias pksyua="paru -Syu --noconfirm"
    alias upall="paru -Syu --noconfirm"
  
    # Aliases for my AUR helper
    alias yay="paru"
    alias aur="paru"
    
    # skip integrity check
    alias paruskip='paru -S --mflags --skipinteg'

    # get fastest mirrors in your neighborhood
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"


end



# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# update font cache
alias update-fc='sudo fc-cache -fv'


# switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /usr/bin/fish && echo 'Now log out.'"

# quickly kill conkies
alias kc='killall conky'

# hardware info --short
alias hw="hwinfo --short"
alias temp="inxi -Fx | grep cpu"


# check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'


# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "
alias ytd="yt-dlp"

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
alias checkerror="sudo journalctl -p 3 -xb"

# gpg
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# common gpg commands
alias dec="gpg --decrypt"
alias enc="gpg --encrypt -r karlfredin@gmail.com"
alias gpgk="gpg --list-secret-keys --keyid-format LONG"


# maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://bike.seedhost.eu/arcolinux/"

# systeminfo
alias probe="sudo -E hw-probe -all -upload"

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# shortcuts to directories
alias awem="cd /home/karl/.config/awesome/"
alias qm="cd /home/karl/.config/qtile/"
alias xm="cd /home/karl/.xmonad/"
alias xbm="cd /home/karl/.config/xmobar/"
alias omfm="cd /home/karl/.config/fish/conf.d"
alias movies="cd /mnt/movies"
alias dmove="cd ~/.dmenu"
alias backup="cd /mnt/backup"
alias backup-home="cd /mnt/backup/home"
alias media="cd /mnt/autofs/music/videos/"
alias cbak="cd ~/Yandex.Disk/Backups/"
alias app="cd /usr/share/applications/"
alias localapp="cd ~/.local/share/applications/"
alias script="cd ~/.scripts/activated"
alias mm="cd /home/karl/.local/share/mail/karlfredin@gmail.com"
alias mbas="cd ~/.config/bash"
alias mqute="cd ~/.config/qutebrowser"
alias mconky="cd ~/.config/conky"
alias mpic="cd ~/Pictures"
alias mvideo="cd ~/Videos"
alias mzsh="cd ~/.config/oh-my-zsh/"
alias mkitty="cd ~/.config/kitty/"
alias mhypr="cd ~/.config/hypr/"
alias mdoom="cd ~/.config/doom/"
alias mway="cd ~/.config/waybar/"
alias learn="cd ~/myrepos/"
alias vm="cd /media/vm"
alias yandex="cd /media/cloud_storage/Yandex.Disk/"
alias games="cd /media/games_1"
alias games2="cd /media/games_/"
alias steam1="cd ~/Games/Steam/steamapps/"
alias steam2="/mnt/ntfs/SteamLibrary/steamapps/"
alias mwine="cd ~/wine"
alias autofs="cd /mnt/autofs"
alias mgit="cd ~/git-reps"
alias mdmenu="cd ~/.dmenu"
alias iso="cd ~/iso"
alias setup="cd ~/myrepos/setup"
alias dmscripts="cd ~/myrepos/dmscripts/.dmenu"
alias dotfiles="cd ~/myrepos/dotfiles"

# checks the values of mouse/keyboards clicks
alias keycheck="xev"

# alias for sudo
alias please="sudo"

# check the wmclass fo windows
alias wmclass="xprop WM_CLASS" 

# Nordvpn
alias vpn="nordvpn status"

# Image viewer
alias sxfa="sxiv -f *"
alias pp="sxiv /var/pictures/backgrounds/*"

# KVM
alias virsh="virsh -c qemu:///system"

# Alias for vifm to add more functionality
alias vifm="vifmrun"

# Clear command
alias cls="clear"

# RM aliases
alias rm="rm -i"
alias rmf="rm -f"
alias rmr="rm -r"
alias rmrf="rm -rf"

# vim for important configuration files
alias vaw="vim ~/.config/awesome/rc.lua"
alias vqt="vim ~/.config/qtile/config.py"
alias qE="vim ~/.config/qtile/config.py"
alias qe="vim ~/.config/qtile/config.py"
alias xe="vim ~/.xmonad/xmonad.hs"
alias vxe="vim ~/.xmonad/xmonad.hs"
alias omfe="vim ~/.config/fish/conf.d/omf.fish"
alias fa="vim ~/.config/fish/config.fish"
alias hostfile="sudo vim /etc/hosts"
alias ec="dm-editconfig"
alias omfA="vim ~/.config/fish/conf.d/aliases.fish"
alias vquick="vim ~/.config/qutebrowser/quickmarks"
alias vqute="vim ~/.config/qutebrowser/config.py"
alias vlightdm="sudo vim /etc/lightdm/lightdm.conf"
alias vpacman="sudo vim /etc/pacman.conf"
alias vgrub="sudo vim /etc/default/grub"
alias vconfgrub="sudo vim /boot/grub/grub.cfg"
alias vmkinitcpio="sudo vim /etc/mkinitcpio.conf"
alias vmirrorlist="sudo vim /etc/pacman.d/mirrorlist"
alias vali="vim ~/Documents/lists/alias.list"
alias vzrc="vim ~/.zshrc"
alias vzsh="vim ~/.zshrc"
alias vfis="vim ~/.config/fish/config.fish"

# Gui editor
alias nv="neovide"

# SSH
alias mediaserver="ssh karl@192.168.1.30"
alias gameserver="ssh karl@192.168.1.31"
alias router="ssh root@10.1.0.1"
alias phoe01="ssh karl@phoe01"  
alias phoe02="ssh karl@phoe02"  
alias phoe03="ssh karl@10.1.0.55"
alias phoe04="ssh karl@10.1.0.55"
alias phoeserver01="ssh karl@10.1.0.50"
alias kssh="kitty +kitten ssh"

# git aliases
alias genc="git clone https://notabug.org/Krock/GI-on-Linux.git"
alias mgen="cd /media/vg_games/genshin-impact/drive_c/Program\ Files/Genshin\ Impact/Genshin\ Impact\ game"

# games legendary 
alias gta="legendary launch 9d2d0eb64d5c44529cece33fe2a46482"     

# default browser
alias defaultbrowser="xdg-settings set default-web-browser"
alias filetokrusader="xdg-mime default org.kde.krusader.desktop inode/directory application"
alias filetopcmanfm="xdg-mime default pcmanfm.desktop inode/directory application"


# Change the default xclip behaviour
alias xclip="xclip -selection clipboard"

# Sets some Variables
#export EDITOR=vim
#export VISUAL=vim
#export omf=/home/karl/.config/fish/conf.d/omf.fish
#export awe=/home/karl/.config/awesome/rc.lua
#export qt=/home/karl/.config/qtile/config.py
#export github='https://github.com'
#export date_for_backup=$(date +%d-%h-%Y-%H-%M )

# export DOCKER_HOST=ssh://karl@192.168.1.31
