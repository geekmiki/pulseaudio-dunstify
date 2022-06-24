#!/bin/bash
function get_volume() {
        pamixer --get-volume
}
function get_icon() {
        if [[ "$1" -lt 34 ]]
    then
        echo -n "audio-volume-low-symbolic"
    elif [[ "$1" -lt 67 ]]
    then
        echo -n "audio-volume-medium-symbolic"
    elif [[ "$1" -le 100 ]]
    then
        echo -n "audio-volume-high-symbolic"
    fi
}
function get_sink() {
        if [[ $(pactl get-default-sink) == 'SINK-NAME-FOR-HEADPHONES' ]];
     then
        echo "Headphones"
     elif [[ $(pactl get-default-sink) == 'SINK-NAME-FOR-LAPTOP-SPEAKERS' ]];
     then echo "Laptop"
     elif [[ $(pactl get-default-sink) == 'SINK-NAME-FOR-EXTERNAL-SPEAKERS' ]];
     then echo "Speakers"
     else
        echo "Other sink"
fi
}
function send_notification() {
        volume=`get_volume`
        vol_icon=`get_icon $volume`
        get_sink=`get_sink`
        dunstify -a "Volume" -u low -r "9654" -h int:value:"$volume" -i "$vol_icon" "$get_sink" "$volume%" -t 2000
}
case $1 in
up)
        # Set the volume on (if it was muted)
        pamixer -u
        pamixer -i 5 --allow-boost
        send_notification $1
        ;;
down)
        pamixer -u
        pamixer -d 5 --allow-boost       ;;
mute)
        pamixer -t
        if $(pamixer --get-mute); then
                dunstify -i audio-volume-muted-symbolic -a "Volume" -t 2000 -r 9654 -u low "Muted"
        else
                send_notification up
        fi
        ;;
esac

        send_notification $1
        
