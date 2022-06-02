num=$(ps -Al | grep picom | wc -l)
if [[ $num -gt 0 ]] ; then
  echo "ON"
else
  echo "OFF"
fi
