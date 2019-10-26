# Start the display
echo "Starting display..."
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx -- -nocursor