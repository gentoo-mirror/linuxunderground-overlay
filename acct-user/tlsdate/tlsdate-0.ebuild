# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for tlsdate daemon"
ACCT_USER_ID=124
ACCT_USER_GROUPS=( tlsdate )
acct-user_add_deps
