#!/bin/sh
### BEGIN INIT INFO
# Provides:          opi-postsetup
# Required-Start:    $network $local_fs $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: <Enter a short description of the software>
# Description:       <Enter a long description of the software>
#                    <...>
#                    <...>
### END INIT INFO

# Author: Tor Krill <tor@openproducts.se>

# PATH should only include /usr/ if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC=opi-postsetup             # Introduce a short description here
NAME=opi-postsetup             # Introduce the short server's name here
DAEMON=/usr/sbin/opi-postsetup # Introduce the server's location here
DAEMON_ARGS=""             # Arguments to run the daemon with
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
SCRIPTDIR=/usr/share/opi-postsetup/scripts

# Exit if the package is not installed
[ -f /etc/opi/firstboot ] || exit 0

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions

#
# Function that starts the daemon/service
#
do_start()
{
	# Return
	#   0 if daemon has been started
	#   1 if daemon was already running
	#   2 if daemon could not be started

	run-parts $SCRIPTDIR
}

case "$1" in
  start)
    [ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC " "$NAME"
    do_start
    case "$?" in
		0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
		2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
	esac
  ;;
  stop)
	;;
  status)
       ;;
  restart|force-reload)
	;;
  *)
	echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
	exit 3
	;;
esac

:
