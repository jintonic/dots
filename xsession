# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# wget https://www.dropbox.com/download?dl=packages/dropbox.py
# mv dropbox.py ~/bin/dropbox
# chmod 755 ~/bin/dropbox
dropbox start

# apt-get install scim scim-pinyin
export XMODIFIERS="@im=SCIM"
scim -d

while true; do
  WTHR=`wget -q -O- http://www.accuweather.com/en/us/vermillion-sd/57069/weather-forecast/335570 | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $10"°, " $14}'|head -1`
  MAIL=`ls -1 $HOME/mail/INBOX/new | wc -l`
  DSK=`df -h | awk '$6=="/" {print $4}'`
  # one needs to worry when load>=8 in a 8-core machine
  CPU=`uptime | awk '{print $(NF-1)}'`
  MEM=`free | grep - | awk '{printf "%.0f%%", $3/($3+$4)*100}'`
  DAT=`date +%F\ %a\ %I:%M%P`
  xsetroot -name "$WTHR, N: $MAIL, D:$DSK, L:$CPU M:$MEM, $DAT"
  sleep 1
done &
dwm
