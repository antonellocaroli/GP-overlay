# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd user

DESCRIPTION="UPnP Media Renderer front-end for MPD, the Music Player Daemon"
HOMEPAGE="https://www.lesbonscomptes.com/upmpdcli/index.html"
LICENSE="GPL-2"

SRC_URI="https://www.lesbonscomptes.com/upmpdcli/downloads/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"
IUSE="thirdparty"

DEPEND="
	dev-libs/jsoncpp
	media-libs/libmpdclient
	net-libs/libmicrohttpd
	>=net-libs/libupnpp-0.20.1
"
RDEPEND="
	${DEPEND}
	thirdparty? ( dev-python/requests )
"

pkg_setup() {
	enewuser "${PN}"
	enewgroup "${PN}"
}

src_compile() {
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit systemd/upmpdcli.service
}

pkg_postinst() {
	einfo
	einfo "This package no longer assumes that upmpdcli is driving an"
	einfo "mpd instance on the same host (https://bugs.gentoo.org/670130)."
	einfo "Probably it is though, so be sure your mpd is built with"
	einfo "USE=curl."
	einfo
	einfo "Consider installing media-sound/sc2mpd.  If upmpdcli"
	einfo "brings is Songcast multiroom synchronised playing"
	einfo "see upstream docs"
	einfo "for more information."
}
