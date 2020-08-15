# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker eutils user

MY_PN=${PN/-bin/}

DESCRIPTION="GentooPlayer binary"
HOMEPAGE="http://gentooplayer.com/"
SRC_URI="https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm64/${PN}-arm64.tar.gz"

#SRC_URI="
#    amd64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-amd64/${PN}-arm64.tar.gz )
#    arm64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm64/${PN}-arm64.tar.gz )
#    arm? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm/${PN}-arm64.tar.gz )
#"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"
RESTRICT="mirror bindist"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"


src_install() {
    dobin *
    newinitd ${FILESDIR}/*
}
