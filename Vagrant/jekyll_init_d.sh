#!/bin/sh
# jekyll Starts and stops Jekyll
#
# chkconfig: - 85 15
# description: Jekyll is a Ruby based website caching engine
# processname: jekyll
# pidfile: /var/run/jekyll.pid
#
# Originally taken from https://gist.github.com/klcodanr/4459175

### BEGIN INIT INFO
# Provides:          jekyll
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Serve jekyll daemon at boot time
# Description:       Serve jekyll daemon at boot time
### END INIT INFO

# Configure your values here
SOURCE=/vagrant

# Generally, shouldn't need to change below here...
PID_FILE=/var/run/jekyll.pid
LOG_FILE=/var/log/jekyll.log

case "$1" in
    start)
        cd $SOURCE
        # Add --force_polling to make watch work inside a Vagrant box.
        # See https://stackoverflow.com/questions/20766260/jekyll-watch-not-working-with
        bundle exec jekyll serve --H 0.0.0.0 --force_polling >> $LOG_FILE &
        echo $! > $PID_FILE
        echo "Jekyll STARTED"
        exit 0
    ;;

    stop)
        kill -TERM $(cat $PID_FILE)
        echo "Jekyll STOPPED"
        exit 0
    ;;

    restart)
        $0 stop
        $0 start
        exit 0
    ;;

    status)
        ps -p `cat $PID_FILE` > /dev/null 2>&1 && echo "Jekyll Running" || echo "Jekyll Not Running"
    ;;

    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac
