#!/sbin/openrc-run

user="root:root"
logfile="/var/log/mympd.log"

start_stop_daemon_args="--user $user"

command="/usr/bin/mympd"
#command_args="-q"

command_background=yes
pidfile=/run/mympd.pid

depend() {
    use alsasound net
    after bootmisc
}
