#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="Spotifyd streams music just like the official client"

user="spotifyd:spotifyd"
logfile="/var/log/spotifyd.log"
command="/usr/bin/spotifyd"

start_stop_daemon_args="--nicelevel -10 --user ${user}"

command_background=yes
pidfile=/run/spotifyd.pid

#need net
depend() {
    use alsasound
    after bootmisc
}

start_pre() {
    checkpath --file --owner $user --mode 0644 $logfile
}

stop() {
    ebegin "Stopping Spotifyd"
    start-stop-daemon --stop --exec $command\
    --retry 15 --pidfile $pidfile
    eend $?
}
