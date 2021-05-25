#!/sbin/openrc-run
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="A headless Squeezebox emulator using ALSA audio output"

user="root:root"
logfile="/var/log/gmediarender.log"

start_stop_daemon_args="--nice -10 --user $user"

command="/usr/bin/gmediarender"
command_args="
	${GM_OPTS}
"

command_background=yes
pidfile=/run/gmediarender.pid

#need net
depend() {
    use alsasound
    after bootmisc net*
}

start_pre() {
    checkpath --file --owner $user --mode 0644 $logfile
}
