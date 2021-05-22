# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker eutils user

MY_PN=${PN/-bin/}

DESCRIPTION="A librespot daemon (spotify endpoint)"
HOMEPAGE="https://github.com/librespot-org/librespot"
SRC_URI="
    amd64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-amd64/${MY_PN}-${PV}-amd64.tar.gz )
    arm64? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm64/${MY_PN}-${PV}-arm64.tar.gz )
    arm? ( https://github.com/antonellocaroli/${PN}/releases/download/${PV}-arm/${MY_PN}-${PV}-arm.tar.gz )
"

LICENSE="librespot"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"
RESTRICT="mirror bindist"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"


src_install() {
    dobin librespot
    newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
    newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
}
