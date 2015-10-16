# apt-get install scim scim-pinyin
export XMODIFIERS="@im=SCIM"
scim -d

while true; do
  # one needs to worry when load>=8 in a 8-core machine
  CPU=`uptime | awk '{print $(NF-1)}'`
  MEM=`free | grep - | awk '{printf "%.0f%%", $3/($3+$4)*100}'`
  DAT=`date +%F\ %a\ %I:%M%P`
  xsetroot -name "L:$CPU M:$MEM, $DAT"
  sleep 1
done &
dwm
