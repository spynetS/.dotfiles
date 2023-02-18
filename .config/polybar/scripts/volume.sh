
volume=`pactl get-sink-volume 66 | awk '{print substr($5, 1, length($5)-1)}'`

if [ $# -eq 0 ]
then
    while [ 1 ]
    do
        volume=`pactl get-sink-volume 66 | awk '{print substr($5, 1, length($5)-1)}'`
        id=`pactl list short sinks | grep RUNNING | awk '{print $1}'`

        if [ `pactl get-sink-mute $id | awk '{print $2}'` = 'yes' ]
        then
            echo 'mute'
        else
            echo $volume
        fi
        sleep 0.1
    done
else
    id=`pactl list short sinks | grep RUNNING | awk '{print $1}'`
    if [ "$1" = 'mute' ]
    then
    if [ `pactl get-sink-mute $id | awk '{print $2}'` = 'no' ]
    then
        pactl set-sink-mute $id yes
    else
        pactl set-sink-mute $id no
    fi

fi
    newvol=$(expr $volume + $1)
    pactl set-sink-volume $id $newvol%
fi



