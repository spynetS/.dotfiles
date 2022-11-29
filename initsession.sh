

if pgrep -x "pipewire" > /dev/null
then
    echo "Running"
else
    pipewire &
    pipewire-pulse &
    pipewire-media-session &
fi

echo pipewire done
picom
wal -R
~/.screenlayout/main.sh
mpd
~/.config/conky/Sirius/start.sh
setxkbmap us
nitrogen --restore
