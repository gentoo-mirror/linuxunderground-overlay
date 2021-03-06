#!/sbin/openrc-run
# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License, v2 or later

name=${RC_SVCNAME}

fbhomedir="/var/run/firebird"
fblogdir="/var/log/firebird"
fbtmpdir="/tmp/firebird"
pidfile="${fbhomedir}/firebird.pid"
command="/usr/sbin/fbguard"
command_args="-forever -daemon -pidfile $pidfile"

start_stop_daemon_args="-p ${pidfile} -u ${FBUSER:-firebird}:${FBGROUP:-firebird}"

depend() {
	need net
}

start_pre() {
	checkpath -q -d -m 0770 -o ${FBUSER:-firebird}:${FBGROUP:-firebird} ${fbhomedir} || return 1
	checkpath -q -d -m 0770 -o ${FBUSER:-firebird}:${FBGROUP:-firebird} ${fblogdir} || return 1
	checkpath -q -d -m 0770 -o ${FBUSER:-firebird}:${FBGROUP:-firebird} ${fbtmpdir} || return 1
}
