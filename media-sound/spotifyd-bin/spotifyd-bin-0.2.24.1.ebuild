# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="A Spotify daemon"
HOMEPAGE="https://github.com/Spotifyd/spotifyd/"
SRC_URI="https://github.com/antonellocaroli/${PN}/releases/download/${PV}-amd64/${MY_PN}-amd64-${PV}.tar.xz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror bindist"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"


src_install() {
    dobin Spotifyd
    newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
    insinto /etc
    newins "${FILESDIR}/${PN}.conf" "${PN}.conf"
}
