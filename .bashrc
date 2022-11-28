### EXPORT ###
export EDITOR='neovide'
export VISUAL='neovide'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus
export PATH="$HOME/.emacs.d/bin:$PATH"

(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
alias nc=ncmpcpp
alias i3config="vim ~/.config/i3/config"
alias awesomeconfig="vim ~/.config/awesome/rc.lua"
alias tab="kitty . &"

PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ALIASES ###

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
# alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy shell configs
alias cb='cp /etc/skel/.bashrc ~/.bashrc && exec bash'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && echo "Copied."'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'


#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist='sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist'
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nhostname="sudo $EDITOR /etc/hostname"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nf="$EDITOR ~/.config/fish/config.fish"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#arcolinux applications
alias att="archlinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

# reporting tools - install when not installed
neofetch
#screenfetch
#alsi
#paleofetch
#fetch
#hfetch
#sfetch
#ufetch
#ufetch-arco
#pfetch
#sysinfo
#sysinfo-retro
#cpufetch
#colorscript random
# shellcheck disable=SC2155,SC2148
#---------+
# Helpers |
#---------+
_trueline_font_style() {
    style="$1"
    case "$style" in
        bold)
            style=1
            ;;
        dim)
            style=2
            ;;
        italic)
            style=3
            ;;
        underlined)
            style=4
            ;;
        **)
            style=22
            ;;
    esac
    style+="m"
    echo "$style"
}

_trueline_content() {
    fg_c="${TRUELINE_COLORS[$1]}"
    bg_c="$2"
    style="$(_trueline_font_style "$3")"
    content="$4"
    esc_seq_start="\["
    esc_seq_end="\]"
    if [[ -n "$5" ]] && [[ "$5" == "vi" ]]; then
        esc_seq_start="\1"
        esc_seq_end="\2"
    fi
    output="$esc_seq_start\033[0m\033[38;2;$fg_c;"
    if [[ "$bg_c" != 'default_bg' ]]; then
        bg_c="${TRUELINE_COLORS[$bg_c]}"
        output+="48;2;$bg_c;"
    fi
    output+="$style$esc_seq_end$content$esc_seq_start\033[0m$esc_seq_end"
    echo "$output"
}

_trueline_separator() {
    if [[ -n "$_last_color" ]]; then
        # Only add a separator if it's not the first section (and hence last
        # color is set/defined)
        if [[ -n "$1" ]]; then
            local bg_color="$1"
        fi
        _trueline_content "$_last_color" "$bg_color" bold "${TRUELINE_SYMBOLS[segment_separator]}"
    fi
}

_trueline_record_colors() {
    local force="$4"
    if [[ -z "$_first_color_fg" ]] || [[ -n "$force" ]]; then
        _first_color_fg="$1"
        _first_color_bg="$2"
        _first_font_style="$3"
    fi
    _last_color="$2"
}

#----------+
# Segments |
#----------+
_trueline_is_root() {
    if [[ "${EUID}" -eq 0 ]]; then
        echo 'is_root'
    fi
}
_trueline_ip_address() {
    \ip route get 1 | tr -s ' ' | cut -d' ' -f7
}
_trueline_has_ssh() {
    if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
        echo 'has_ssh'
    fi
}
_trueline_user_segment() {
    local fg_color="$1"
    local bg_color="$2"
    local font_style="$3"
    local user="$USER"
    local is_root="$(_trueline_is_root)"
    if [[ -n "$is_root" ]]; then
        if [[ -z "$user" ]]; then
            user='root'
        fi
        fg_color=${TRUELINE_USER_ROOT_COLORS[0]}
        bg_color=${TRUELINE_USER_ROOT_COLORS[1]}
    fi
    local has_ssh="$(_trueline_has_ssh)"
    if [[ -n "$has_ssh" ]]; then
        user="${TRUELINE_SYMBOLS[ssh]} $user"
    fi
    if [[ -n "$has_ssh" ]] || [[ "$TRUELINE_USER_ALWAYS_SHOW_HOSTNAME" = true ]]; then
        user+="@"
        if [ "$TRUELINE_USER_SHOW_IP_SSH" = true ]; then
            user+="$(_trueline_ip_address)"
        elif [ "$TRUELINE_USER_SHORTEN_HOSTNAME" = true ]; then
            user+="$(hostname -s)"
        else
            user+="$HOSTNAME"
        fi
    fi
    local segment="$(_trueline_separator)"
    segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " $user ")"
    PS1+="$segment"
    _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
}

_trueline_has_venv() {
    printf "%s" "${VIRTUAL_ENV##*/}"
}
_trueline_venv_segment() {
    local venv="$(_trueline_has_venv)"
    if [[ -n "$venv" ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[venv]} $venv ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_has_conda_env() {
    printf "%s" "${CONDA_DEFAULT_ENV}"
}
_trueline_conda_env_segment() {
    local conda_env="$(_trueline_has_conda_env)"
    if [[ -n "$conda_env" ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[venv]} $conda_env")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_has_aws_profile() {
    printf "%s" "${AWS_PROFILE}"
}
_trueline_aws_profile_segment() {
    local profile_aws="$(_trueline_has_aws_profile)"
    if [[ -n "$profile_aws" ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[aws_profile]} $profile_aws ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_has_git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [[ "$?" -ne "128" ]]; then
        printf "%s" "$branch"
    else
        printf "%s" ""
    fi
}
_trueline_git_mod_files() {
    nr_mod_files="$(git diff --name-only --diff-filter=M 2> /dev/null | wc -l | sed 's/^ *//')"
    mod_files=''
    if [[ ! "$nr_mod_files" -eq 0 ]]; then
        mod_files="${TRUELINE_SYMBOLS[git_modified]} "
        if [[ "$TRUELINE_GIT_SHOW_STATUS_NUMBERS" = true ]]; then
            mod_files+="$nr_mod_files "
        fi
    fi
    echo "$mod_files"
}
_trueline_git_behind_ahead() {
    branch="$1"
    upstream="$(git config --get branch."$branch".merge)"
    if [[ -n $upstream ]]; then
        nr_behind_ahead="$(git rev-list --count --left-right '@{upstream}...HEAD' 2> /dev/null)" || nr_behind_ahead=''
        nr_behind="${nr_behind_ahead%	*}"
        nr_ahead="${nr_behind_ahead#*	}"
        git_behind_ahead=''
        if [[ ! "$nr_behind" -eq 0 ]]; then
            git_behind_ahead+="${TRUELINE_SYMBOLS[git_behind]} "
            if [[ "$TRUELINE_GIT_SHOW_STATUS_NUMBERS" = true ]]; then
                git_behind_ahead+="$nr_behind "

            fi
        fi
        if [[ ! "$nr_ahead" -eq 0 ]]; then
            git_behind_ahead+="${TRUELINE_SYMBOLS[git_ahead]} "
            if [[ "$TRUELINE_GIT_SHOW_STATUS_NUMBERS" = true ]]; then
                git_behind_ahead+="$nr_ahead "

            fi
        fi
        echo "$git_behind_ahead"
    fi
}
_trueline_git_remote_icon() {
    remote=$(command git ls-remote --get-url 2> /dev/null)
    remote_icon="${TRUELINE_SYMBOLS[git_branch]}"
    if [[ "$remote" =~ "github" ]]; then
        remote_icon="${TRUELINE_SYMBOLS[git_github]} "
    elif [[ "$remote" =~ "bitbucket" ]]; then
        remote_icon="${TRUELINE_SYMBOLS[git_bitbucket]} "
    elif [[ "$remote" =~ "gitlab" ]]; then
        remote_icon="${TRUELINE_SYMBOLS[git_gitlab]} "
    fi
    if [[ -n "${remote_icon// /}" ]]; then
        remote_icon=" $remote_icon "
    fi
    echo "$remote_icon"
}
_trueline_git_segment() {
    local branch="$(_trueline_has_git_branch)"
    if [[ -n $branch ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"

        local branch_icon="$(_trueline_git_remote_icon)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" "$branch_icon$branch ")"
        local mod_files="$(_trueline_git_mod_files)"
        if [[ -n "$mod_files" ]]; then
            segment+="$(_trueline_content "$TRUELINE_GIT_MODIFIED_COLOR" "$bg_color" "$font_style" "$mod_files")"
        fi
        local behind_ahead="$(_trueline_git_behind_ahead "$branch")"
        if [[ -n "$behind_ahead" ]]; then
            segment+="$(_trueline_content "$TRUELINE_GIT_BEHIND_AHEAD_COLOR" "$bg_color" "$font_style" "$behind_ahead")"
        fi
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_working_dir_segment() {
    local fg_color="$1"
    local bg_color="$2"
    local font_style="$3"
    local segment="$(_trueline_separator)"
    local wd_separator="${TRUELINE_SYMBOLS[working_dir_separator]}"
    if [[ "$TRUELINE_WORKING_DIR_SPACE_BETWEEN_PATH_SEPARATOR" = true ]]; then
        wd_separator=" $wd_separator "
    fi

    local p="${PWD/$HOME/${TRUELINE_SYMBOLS[working_dir_home]}}"
    local arr=
    IFS='/' read -r -a arr <<< "$p"
    local path_size="${#arr[@]}"
    if [[ "$path_size" -eq 1 ]]; then
        local path_="\[\033[1m\]${arr[0]:=/}"
    elif [[ "$path_size" -eq 2 ]]; then
        local path_="${arr[0]:=/}$wd_separator\[\033[1m\]${arr[+1]}"
    else
        if [[ "$path_size" -gt 3 ]]; then
            if [[ "$TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS" = true ]]; then
                p=$(echo "$p" | sed -r "s:([^/]{,$TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS_LENGTH})[^/]*/:\1/:g")
            else
                p="${TRUELINE_SYMBOLS[working_dir_folder]}/"$(echo "$p" | rev | cut -d '/' -f-3 | rev)
            fi
        fi
        local curr=$(basename "$p")
        p=$(dirname "$p")
        local path_="${p//\//$wd_separator}$wd_separator\[\033[1m\]$curr"
        if [[ "${p:0:1}" = '/' ]]; then
            path_="/$path_"
        fi
    fi
    segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " $path_ ")"
    PS1+="$segment"
    _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
}

_trueline_bg_jobs_segment() {
    # Note: We clear terminated foreground job information by first calling
    # `jobs &>/dev/null' and then obtain the information of the currently running
    # jobs by `jobs -p'.
    local bg_jobs=$(
        jobs &> /dev/null
        jobs -p | wc -l | sed 's/^ *//'
    )
    if [[ ! "$bg_jobs" -eq 0 ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[bg_jobs]} $bg_jobs ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_is_read_only() {
    if [[ ! -w $PWD ]]; then
        echo 'read_only'
    fi
}
_trueline_read_only_segment() {
    local read_only="$(_trueline_is_read_only)"
    if [[ -n $read_only ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[read_only]} ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_exit_status_segment() {
    if [[ "$_exit_status" != 0 ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" "${TRUELINE_SYMBOLS[exit_status]} $_exit_status ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

_trueline_newline_segment() {
    local fg_color="$1"
    local bg_color="$2"
    local font_style="$3"
    local is_root="$(_trueline_is_root)"
    local newline_symbol="${TRUELINE_SYMBOLS[newline]}"
    if [[ -n "$is_root" ]]; then
        local newline_symbol="${TRUELINE_SYMBOLS[newline_root]}"
    fi
    local segment="$(_trueline_separator default_bg)"
    segment+="\n"
    segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" "$newline_symbol")"
    PS1+="$segment"
    _trueline_record_colors "$fg_color" "$bg_color" "$font_style" true
}

_trueline_vimode_cursor_shape() {
    shape="$1"
    case "$shape" in
        under)
            cursor_parameter=4
            ;;
        vert)
            cursor_parameter=6
            ;;
        **)
            cursor_parameter=2
            ;;
    esac
    echo "\1\e[$cursor_parameter q\2"
}
_trueline_vimode_segment() {
    if [[ "$TRUELINE_SHOW_VIMODE" = true ]]; then
        if [[ ! -o vi ]]; then
            set -o vi
        fi

        local seg_separator=${TRUELINE_SYMBOLS[segment_separator]}

        bind "set show-mode-in-prompt on"
        local vimode_ins_fg=${TRUELINE_VIMODE_INS_COLORS_STYLE[0]}
        local vimode_ins_bg=${TRUELINE_VIMODE_INS_COLORS_STYLE[1]}
        local vimode_ins_font_style=${TRUELINE_VIMODE_INS_COLORS_STYLE[2]}
        local segment="$(_trueline_content "$vimode_ins_fg" "$vimode_ins_bg" "$vimode_ins_font_style" " ${TRUELINE_SYMBOLS[vimode_ins]} " "vi")"
        segment+="$(_trueline_content "$vimode_ins_bg" "$_first_color_bg" bold "$seg_separator" "vi")"
        segment+="$(_trueline_vimode_cursor_shape "$TRUELINE_VIMODE_INS_CURSOR")"
        bind "set vi-ins-mode-string $segment"

        local vimode_cmd_fg=${TRUELINE_VIMODE_CMD_COLORS_STYLE[0]}
        local vimode_cmd_bg=${TRUELINE_VIMODE_CMD_COLORS_STYLE[1]}
        local vimode_cmd_font_style=${TRUELINE_VIMODE_CMD_COLORS_STYLE[2]}
        segment="$(_trueline_content "$vimode_cmd_fg" "$vimode_cmd_bg" "$vimode_cmd_font_style" " ${TRUELINE_SYMBOLS[vimode_cmd]} " "vi")"
        segment+="$(_trueline_content "$vimode_cmd_bg" "$_first_color_bg" bold "$seg_separator" "vi")"
        segment+="$(_trueline_vimode_cursor_shape "$TRUELINE_VIMODE_CMD_CURSOR")"
        bind "set vi-cmd-mode-string $segment"

        # Switch to block cursor before executing a command
        bind -m vi-insert 'RETURN: "\e\n"'
    else
        bind "set show-mode-in-prompt off"
    fi
}

_trueline_cmd_duration_segment() {

    function _trueline_format_time {
        local T=$1
        local D=$((T / 60 / 60 / 24))
        local H=$((T / 60 / 60 % 24))
        local M=$((T / 60 % 60))
        local S=$((T % 60))
        local result=""

        ((D > 0)) && result="${D}d "
        ((H > 0)) && result="${result}${H}h "
        ((M > 0)) && result="${result}${M}m "
        ((S > 0)) && result="${result}${S}s "
        echo -e "${result}" | sed -e 's/[[:space:]]*$//'
    }

    function _trueline_timestamp_cleanup() {
        command rm -f "$TRUELINE_TIMESTAMP_FILE" 2> /dev/null
    }

    trap _trueline_timestamp_cleanup EXIT

    # PS0 gets expanded after a command is read (just before execution)
    TRUELINE_TIMESTAMP_FILE="/tmp/trueline.user-${USER}.pid-$$.timestamp"
    # shellcheck disable=SC2034,SC2016
    PS0='$(date +%s > "$TRUELINE_TIMESTAMP_FILE")'

    local duration=0
    if [ -e "$TRUELINE_TIMESTAMP_FILE" ]; then
        local end=$(date +%s)
        local start=$(cat "$TRUELINE_TIMESTAMP_FILE")
        duration="$((end - start))"
        _trueline_timestamp_cleanup
    fi

    if ((duration > 0)); then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        local elapsed="$(_trueline_format_time duration)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " ${TRUELINE_SYMBOLS[timer]}$elapsed ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

#-------------+
# PS1 and PS2 |
#-------------+
_trueline_continuation_prompt() {
    PS2=$(_trueline_content "$_first_color_fg" "$_first_color_bg" "$_first_font_style" " ${TRUELINE_SYMBOLS[ps2]} ")
    PS2+=$(_trueline_content "$_first_color_bg" default_bg bold "${TRUELINE_SYMBOLS[segment_separator]} ")
}

_trueline_prompt_command() {
    local _exit_status="$?"
    PS1=""

    local segment_def=
    for segment_def in "${TRUELINE_SEGMENTS[@]}"; do
        local segment_name=$(echo "$segment_def" | cut -d ',' -f1)
        local segment_fg=$(echo "$segment_def" | cut -d ',' -f2)
        local segment_bg=$(echo "$segment_def" | cut -d ',' -f3)
        local font_style=$(echo "$segment_def" | cut -d ',' -f4)
        # Note: we cannot call within a subshell because global variables
        # (such as _last_color) won't be passed along
        '_trueline_'"$segment_name"'_segment' "$segment_fg" "$segment_bg" "$font_style"
    done

    _trueline_vimode_segment
    PS1+=$(_trueline_content "$_last_color" default_bg bold "${TRUELINE_SYMBOLS[segment_separator]}")
    PS1+=" " # non-breakable space
    _trueline_continuation_prompt

    unset _first_color_fg
    unset _first_color_bg
    unset _first_font_style
    unset _last_color

    # Note: we reset the exit status to the original value for the subsequent
    # commands in PROMPT_COMMAND.
    return "$_exit_status"
}

#---------------+
# Configuration |
#---------------+
declare -A TRUELINE_COLORS_DEFAULT=(
    [black]='36;39;46'        #24272e
    [cursor_grey]='40;44;52'  #282c34
    [green]='152;195;121'     #98c379
    [grey]='171;178;191'      #abb2bf
    [light_blue]='97;175;239' #61afef
    [mono]='130;137;151'      #828997
    [orange]='209;154;102'    #d19a66
    [purple]='198;120;221'    #c678dd
    [red]='224;108;117'       #e06c75
    [special_grey]='59;64;72' #3b4048
    [white]='208;208;208'     #d0d0d0
)
if [[ "${#TRUELINE_COLORS[@]}" -eq 0 ]]; then
    declare -A TRUELINE_COLORS=()
fi
for i in "${!TRUELINE_COLORS_DEFAULT[@]}"; do
    if [[ ! "${TRUELINE_COLORS["$i"]+exists}" ]]; then
        TRUELINE_COLORS["$i"]="${TRUELINE_COLORS_DEFAULT["$i"]}"
    fi
done
unset TRUELINE_COLORS_DEFAULT

if [[ "${#TRUELINE_SEGMENTS[@]}" -eq 0 ]]; then
    declare -a TRUELINE_SEGMENTS=(
        'user,black,white,bold'
        'aws_profile,black,orange,bold'
        'venv,black,purple,bold'
        'conda_env,black,purple,bold'
        'git,grey,special_grey,normal'
        'working_dir,mono,cursor_grey,normal'
        'read_only,black,orange,bold'
        'bg_jobs,black,orange,bold'
        'exit_status,black,red,bold'
        # 'cmd_duration,black,grey,normal'
        # 'newline,black,orange,bold'
    )
fi

declare -A TRUELINE_SYMBOLS_DEFAULT=(
    [aws_profile]=''
    [bg_jobs]=''
    [exit_status]=''
    [git_ahead]=''
    [git_behind]=''
    [git_bitbucket]=''
    [git_branch]=''
    [git_github]=''
    [git_gitlab]=''
    [git_modified]=''
    [newline]='  '
    [newline_root]='  '
    [ps2]='...'
    [read_only]=''
    [segment_separator]=''
    [ssh]=''
    [timer]='羽'
    [venv]=''
    [vimode_cmd]='N'
    [vimode_ins]='I'
    [working_dir_folder]=''
    [working_dir_home]=''
    [working_dir_separator]=''
)
if [[ "${#TRUELINE_SYMBOLS[@]}" -eq 0 ]]; then
    declare -A TRUELINE_SYMBOLS=()
fi
for i in "${!TRUELINE_SYMBOLS_DEFAULT[@]}"; do
    if [[ ! "${TRUELINE_SYMBOLS["$i"]+exists}" ]]; then
        TRUELINE_SYMBOLS["$i"]="${TRUELINE_SYMBOLS_DEFAULT["$i"]}"
    fi
done
unset TRUELINE_SYMBOLS_DEFAULT

# Vimode
if [[ -z "$TRUELINE_SHOW_VIMODE" ]]; then
    TRUELINE_SHOW_VIMODE=false
fi
if [[ -z "$TRUELINE_VIMODE_INS_COLORS_STYLE" ]]; then
    TRUELINE_VIMODE_INS_COLORS_STYLE=('black' 'light_blue' 'bold')
fi
if [[ -z "$TRUELINE_VIMODE_CMD_COLORS_STYLE" ]]; then
    TRUELINE_VIMODE_CMD_COLORS_STYLE=('black' 'green' 'bold')
fi
if [[ -z "$TRUELINE_VIMODE_INS_CURSOR" ]]; then
    TRUELINE_VIMODE_INS_CURSOR='vert'
fi
if [[ -z "$TRUELINE_VIMODE_CMD_CURSOR" ]]; then
    TRUELINE_VIMODE_CMD_CURSOR='block'
fi

# Git
if [[ -z "$TRUELINE_GIT_SHOW_STATUS_NUMBERS" ]]; then
    TRUELINE_GIT_SHOW_STATUS_NUMBERS=true
fi
if [[ -z "$TRUELINE_GIT_MODIFIED_COLOR" ]]; then
    TRUELINE_GIT_MODIFIED_COLOR='red'
fi
if [[ -z "$TRUELINE_GIT_BEHIND_AHEAD_COLOR" ]]; then
    TRUELINE_GIT_BEHIND_AHEAD_COLOR='purple'
fi

# User
if [[ -z "$TRUELINE_USER_ROOT_COLORS" ]]; then
    TRUELINE_USER_ROOT_COLORS=('black' 'red')
fi
if [[ -z "$TRUELINE_USER_SHOW_IP_SSH" ]]; then
    TRUELINE_USER_SHOW_IP_SSH=false
fi
if [[ -z "$TRUELINE_USER_ALWAYS_SHOW_HOSTNAME" ]]; then
    TRUELINE_USER_ALWAYS_SHOW_HOSTNAME=false
fi
if [[ -z "$TRUELINE_USER_SHORTEN_HOSTNAME" ]]; then
    TRUELINE_USER_SHORTEN_HOSTNAME=false
fi

# Working dir
if [[ -z "$TRUELINE_WORKING_DIR_SPACE_BETWEEN_PATH_SEPARATOR" ]]; then
    TRUELINE_WORKING_DIR_SPACE_BETWEEN_PATH_SEPARATOR=true

fi
if [[ -z "$TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS" ]]; then
    TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS=false
fi
if [[ -z "$TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS_LENGTH" ]]; then
    TRUELINE_WORKING_DIR_ABBREVIATE_PARENT_DIRS_LENGTH=1
fi

#----------------+
# PROMPT_COMMAND |
#----------------+
if ((BASH_VERSINFO[0] > 5 || BASH_VERSINFO[0] == 5 && BASH_VERSINFO[1] >= 1)); then
    # Bash 5.1 and above supports the PROMPT_COMMAND array
    PROMPT_COMMAND=${PROMPT_COMMAND-}
    PROMPT_COMMAND+=(_trueline_prompt_command)
else
    # shellcheck disable=SC2128,SC2178
    PROMPT_COMMAND="_trueline_prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
