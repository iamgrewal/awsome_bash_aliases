#!/bin/bash
touch ~/.bash_profile
sudo apt install python3 python3-pip -y
 
cat << 'EOF' | tee ~/.bash_aliases >> /dev/null
####Compiled by Jatinder Grewal
###### iamgrewal.com
# ~/.bashrc: executed by bash(1) for non-login shells.
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
#PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
#umask 022
# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# Easy way to extract archives
extract () {
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2)   tar xvjf "$1"    ;;
           *.tar.gz)    tar xvzf "$1"    ;;
           *.bz2)       bunzip2 "$1"     ;;
           *.rar)       unrar x "$1"     ;;
           *.gz)        gunzip "$1"      ;;
           *.tar)       tar xvf "$1"     ;;
           *.tbz2)      tar xvjf "$1"    ;;
           *.tgz)       tar xvzf "$1"    ;;
           *.zip)       unzip "$1"       ;;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x "$1"        ;;
           *)           echo "I don't know how to extract $1..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

#Create a .7z compressed file
#Use as: 7zip "/path/to/folder_or_file" "/path/to/output.7z"
function 7zip() { 7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mhe=on "$2" "$1"; }

# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Move 'up' so many directories instead of using several cd ../../, etc.
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"
# Change Directories
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep='history | grep'
alias l="ls"
alias l='ls -lAh'
alias ls="ls -a"
alias ll="ls -al"
# Common variations of 'ls' command
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"
alias :q="exit"
alias ext="exit"
alias xt="exit"
alias by="exit"
alias bye="exit"
alias die="exit"
alias quit="exit"
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ainstall="sudo apt update && sudo apt install -y"
alias update="sudo apt update"
alias apt="sudo apt"
alias nano="nano -c"
alias reboot="sudo /sbin/reboot 0"
alias poweroff="sudo /sbin/poweroff"
alias halt="sudo /sbin/halt"
alias shutdown="sudo /sbin/shutdown"
alias flighton='sudo rfkill block all'
alias flightoff='sudo rfkill unblock all'
alias snr='sudo service network-manager restart'
alias ports='sudo netstat -tulanp'
alias meminfo="free -m -l -t"
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"
alias paux='ps aux | grep'
# Get server cpu info
alias cpuinfo="lscpu"
# Older system use /proc/cpuinfo
alias cpuinfo="less /proc/cpuinfo"
# Get GPU ram on desktop / laptop
alias gpumeminfo="grep -i --color memory /var/log/Xorg.0.log"
# Resume wget by default
alias wget="wget -c"
# Grabs the disk usage in the current directory
alias usage='du -ch | grep total'
# Gets the total disk usage on your machine
alias totalusage='df -hl --total | grep total'
# Shows the individual partition usages without the temporary memory values
alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
# Gives you what is using the most space. Both directories and files. Varies on current directory
alias most='du -hsx * | sort -rh | head -10'
#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Colors for All grep commands such as grep, egrep and zgrep
export GREP_OPTIONS='--color=auto'

# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# 'cd' to the most recently modified directory in $PWD
cl()
{
        last_dir="$(ls -Frt | grep '/$' | tail -n1)"
        if [ -d "$last_dir" ]; then
                cd "$last_dir"
        fi
}

# Directory bookmarking (one at a time)
rd(){
    pwd > "$HOME/.lastdir_$1"
}

crd(){
        lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>&1
        if [ -d "$lastdir" ]; then
                cd "$lastdir"
        else
                echo "no existing directory stored in buffer $1">&2
        fi
}

# 'cd' into a directory and then list contents
cdls() { cd "$1"; ls;}
#For when you've spent too much time in DOS
alias cls="clear"
alias dir="ls"
alias deltree="rm -r"
alias rmdir="rm -r"
alias rd="rm -r"
alias rename="mv"
alias cd..="cd .."
alias chdir="pwd"
alias cmd="bash"
alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
alias erase="rm"
alias del="rm"
alias delete="rm"
alias expand="extract"
diskcopy(){ dd if="$1" of="$2" ; }
alias tasklist="htop"
alias tracert="traceroute"
#Generate a random, "strong" (hopefully) password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}

#Show active ports
alias port='netstat -tulanp'
#Uses 'nmap' to scan all of the connected devices on your router
#You may need to change the '192.168.0.*' part to better match how your
#router gives addresses. This will not give you hostnames, only MAC
#addresses.
alias lanscan='sudo nmap -sn 192.168.0.*'

#Kill any lingering SSH processes
function sshkill() { ps aux | grep ssh | grep -v grep | grep -v sshd | awk {'print $2'} | xargs -r kill -9; }

#Rough function to display the number of unread emails in your gmail:
#gmail [user name]
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'; }

#Use these for when the boss comes around to look busy.
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
function busytext() { while true; do sleep .15; head /dev/urandom | tr -dc A-Za-z0-9; done; }

#Print last value returned from previous command
lastvalue='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'

#Translator; requires Internet
#Usage: translate <phrase> <output-language>
#Example: translate "Bonjour! Ca va?" en
#See this for a list of language codes:
#http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate(){ wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; }

#Prints (or creates if not there) a task list when a terminal is opened
TASKFILE="$HOME/.bashtask" #Hidden for neatness
NC='\033[0m' # No Color
LIGHTRED='\e[1;31m'
LIGHTBLUE='\e[1;34m'
if [ -f "$TASKFILE" ] && [ $(stat -c %s "$TASKFILE") != 0 ] #Check if file has content
then
    echo -e "${LIGHTRED}Task List${NC} as of ${LIGHTBLUE}$(date -r "$TASKFILE")${NC}"
    echo ""
    cat "$TASKFILE"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
else
    echo "Yay! No tasks :)"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
    touch "$TASKFILE"
fi
alias tasklist="bash"
funX`
#If you are encrypting/decrypting files using OpenSSL...
function encrypt() { openssl smime -encrypt -binary -aes-256-cbc -in "$1" -out "$2" -outform DEM "$3" ; } #"$3" is path to public key
function decrypt() { openssl smime -decrypt -in "$1" -binary -inform DEM -inkey "$2" ; } #"$2" is path to private key

#Sorts out unique lines in text file in alphabetical order
function unique() { sort "$1" | uniq -u ; }

#Internet speed test using cURL and Python
function int-speed() { curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - ; }

#Grab a copy of an entire website or starting from whichever URL you use
#in place of "$1". It doesn't always work 100% of the time and do not
#get made at me if a server bands you for using it.
function grabindex() { wget  -e robots=off -r -k -nv -nH -l inf -R --reject-regex '(.*)\?(.*)'  --no-parent "$1" ; }
alias rsynccp='rsync --recursive --times --modify-window=2 --progress --verbose --itemize-changes --stats --human-readable --chmod=Du+rwx,go-rwx,Fu+rw,go-rw --no-perms'

alias rsyncmv='rsync --remove-source-files --recursive --times --modify-window=2 --progress --verbose --itemize-changes --stats --human-readable --chmod=Du+rwx,go-rwx,Fu+rw,go-rw --no-perms'
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias systemctl='sudo systemctl'
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y'
alias update='sudo apt-get update'
alias dl='docker ps && docker stack ls && docker service ls'
EOF

echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
source ~/.bashrc