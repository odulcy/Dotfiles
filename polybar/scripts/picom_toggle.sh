num=$(ps -Al | grep picom | wc -l)
if [[ $num -gt 0 ]] ; then
  killall picom
else
  picom --config ~/.config/picom/picom.conf -b
fi
