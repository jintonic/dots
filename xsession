# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# wget https://www.dropbox.com/download?dl=packages/dropbox.py
# mv dropbox.py ~/bin/dropbox
# chmod 755 ~/bin/dropbox
dropbox start

# apt-get install scim scim-pinyin
#export XMODIFIERS="@im=SCIM"
#scim -d

while true; do
  MAIL=`ls -1 $HOME/mail/INBOX/new | wc -l`
  DSK=`df -h | awk '$6=="/" {print $4}'`
  # one needs to worry when load>=8 in a 8-core machine
  CPU=`uptime | awk '{print $(NF-1)}'`
  MEM=`free | grep Mem | awk '{printf "%.0f%%", ($2-$7)/$2*100}'`
  DAT=`date +'%b.%d %a.%l:%M%P'`
  xsetroot -name "$MAIL, $DSK $CPU $MEM $DAT"
  sleep 1
done &
dwm
