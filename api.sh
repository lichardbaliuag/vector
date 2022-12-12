#!/usr/bin/env bash

### BEGIN INIT INFO
# Provides:             api
# Required-Start:       $remote_fs $syslog
# Required-Stop:        $remote_fs $syslog
# Default-Start:        2 3 4 5
# Default-Stop:
# Short-Description:    OpenBSD Secure Shell server
### END INIT INFO

# If using api.sh, this must be copied to /etc/init.d/api
# then sudo systemctl enable api
# OR
# use api.service in /etc/systemd/system

# If tmdbv3api installed globally, no need to export Python path

export PYTHONPATH="$PYTHONPATH:/home/azureuser/.local/lib/python3.6/site-packages:/usr/lib/python3/dist-packages"

# Quick start-stop-daemon example, derived from Debian /etc/init.d/ssh
set -e

# Must be a valid filename
NAME=api
PIDFILE=/var/run/$NAME.pid
#This is the command to be run, give the full pathname
DAEMON=/home/azureuser/vector/api.py

case "$1" incho
  start)
        echo -n "Starting daemon: "$NAME
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS &
        echo "."
    ;;
  stop)
        echo -n "Stopping daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
        echo "."
    ;;
  restart)
        echo -n "Restarting daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --retry 30 --pidfile $PIDFILE
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
    echo "."
    ;;

  *)
    echo "Usage: "$1" {start|stop|restart}"
    exit 1
esac

exit 0
