# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker eutils user

MY_PN=${PN/-bin/}

DESCRIPTION="Tool to create audio processing pipelines for applications such as active crossovers or room correction"
HOMEPAGE="https://github.com/HEnquist/camilladsp"
SRC_URI="
    amd64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-amd64/${PN}-${PV}-amd64.tar.gz )
    arm64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm64/${PN}-${PV}-arm64.tar.gz )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="mirror bindist"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"


src_install() {
    dobin camilladsp
    local mypath=/etc/alsa/conf.d
    insinto "${mypath}"
    newins "${FILESDIR}"/camilladsp.conf camilladsp.conf
}
