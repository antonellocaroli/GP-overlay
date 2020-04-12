#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="Spotifyd streams music just like the official client"

user="root:root"
logfile="/var/log/spotifyd.log"
command="/usr/bin/spotifyd"
command_args="--no-daemon"
start_stop_daemon_args="--nicelevel -10 --stderr ${logfile}"

command_background=yes
pidfile=/run/spotifyd.pid

#need net
depend() {
    use alsasound
    after bootmisc
}

stop() {
    ebegin "Stopping Spotifyd"
    start-stop-daemon --stop --quiet \
    --exec /usr/bin/spotifyd
    eend $?
}
