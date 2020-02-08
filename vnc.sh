#!/bin/bash

#https://portal.tacc.utexas.edu/user-guides/stampede2#remote-desktop-access

#SBATCH -J VNC         # Job name
#SBATCH -t 89-23:0     # Job duration (89 days and 23 hours)
#SBATCH -p preemptible # Queue name
#SBATCH -o %j.out      # Output File Name
#SBATCH -N 1           # Total number of nodes requested (20 cores/node)

echo job $JOB_ID started at: `date`

NODE_HOSTNAME=`hostname -s`
VNCSERVER_BIN=`which vncserver`
echo "run $VNCSERVER_BIN"

# Check whether a vncpasswd file exists.  If not, complain and exit.
if [ \! -e $HOME/.vnc/passwd ] ; then
  echo "You must run 'vncpasswd' once before launching a vnc session"
  exit 1
fi

# launch VNC session
VNC_DISPLAY=`$VNCSERVER_BIN $@ -bs 2>&1 | grep desktop | awk -F: '{print $3}'`

# make sure this is a valid display
if [ x$VNC_DISPLAY == "x" ]; then
  echo "failed to launch VNC: No X display found"
  exit 1
fi
export DISPLAY=":$VNC_DISPLAY"

LOCAL_VNC_PORT=`expr 5900 + $VNC_DISPLAY`
echo "VNC port @ $NODE_HOSTNAME is $LOCAL_VNC_PORT"

# create reverse tunnel port to login node.
ssh -vfgN -R 54396:$NODE_HOSTNAME:$LOCAL_VNC_PORT login

# address dconf complains, see
# https://bugzilla.redhat.com/show_bug.cgi?id=921689
export XDG_RUNTIME_DIR=~/run/user/$UID

# run window manager; execution will hold here
fluxbox
#gnome-shell -d :$VNC_DISPLAY

# clearn up
echo $VNCSERVER_BIN -kill $DISPLAY
$VNCSERVER_BIN -kill $DISPLAY

# wait a brief moment so vncserver can clean up after itself
sleep 1

rm ~/.vnc/*.cluster:*.log *.out

echo job $JOB_ID finished at: `date`
