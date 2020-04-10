# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker eutils user

MY_PN=${PN/-bin/}

DESCRIPTION="A Spotify daemon"
HOMEPAGE="https://github.com/Spotifyd/spotifyd/"
SRC_URI="https://github.com/antonellocaroli/spotifyd-bin/releases/download/0.2.24-1/spotifyd-0.2.24-1-amd64.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror bindist"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

pkg_setup() {
	# Create the user and group if not already present
	enewgroup spotifyd
	enewuser spotifyd -1 -1 "/dev/null" audio
}


src_install() {
    dobin spotifyd
    newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
    insinto /etc
    newins "${FILESDIR}/${MY_PN}.conf" "${MY_PN}.conf"
}
