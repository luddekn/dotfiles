if type "xrandr"; then
  polybar --reload --config=/home/lk/.config/polybar/config.ini toph 
 # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
 #   MONITOR=$m polybar --reload --config=/home/lk/.config/polybar/config.ini toph &
 # done
else	
  polybar --reload --config=/home/lk/.config/polybar/config.ini toph 
fi
