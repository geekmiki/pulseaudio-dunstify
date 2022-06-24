# pulseaudio-dunstify
A script that adjusts Pulseaudio volume and sends a Dunst notification with icon and sink name

Inspired from:
https://gist.github.com/Liblor/b01549fef2d3d56247ff0292034a3ad6
https://gist.github.com/Chanasit/616609eaf3fd69f85643e1ef61f6cc07

In order to get the script to work you need to populate 'SINK-NAME-FOR-DEVICE' sections.
To get the list of all available sinks on your machine use "pactl list sinks short"
