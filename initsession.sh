

if pgrep -x "pipewire" > /dev/null
then
    echo "Running"
else
    pipewire &
    pipewire-pulse &
    pipewire-media-session &
fi

echo pipewire done
wal -R
picom
# ~/.screenlayout/main.sh
mpd
# ~/.config/conky/Sirius/start.sh
setxkbmap us
nitrogen --restore

