#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

user="root:root"

logfile="/var/log/camillagui.log"
command="/opt/camillagui/main.py"
pidfile="/run/camillagui.pid"

depend() {
    use alsasound
    after bootmisc
}

command_background=yes
pidfile=/run/camillagui.pid

start_pre() {
    checkpath --file --mode 0644 $logfile
}

stop() {
    ebegin "Stopping camillagui"
    start-stop-daemon --stop --exec $command\
    --retry 15 --pidfile $pidfile
    eend $?
}
