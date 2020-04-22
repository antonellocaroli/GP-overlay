#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="librespot is an open source client library for Spotify."

user="root:root"
logfile="/var/log/librespot.log"
command="/usr/bin/librespot"
start_stop_daemon_args="--nicelevel -10 --stderr ${logfile}"
config="${config:-/etc/conf.d/librespot}"
command_args="${LS_OPTS}"

command_background=yes
pidfile=/run/librespot.pid

#need net
depend() {
    use alsasound
    after bootmisc
}

stop() {
    ebegin "Stopping Librespot"
    start-stop-daemon --stop --quiet \
    --exec /usr/bin/librespot
    eend $?
}
