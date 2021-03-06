# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="http://www.signalyst.eu/bins/hqplayer/bionic/${MY_PN}_${PV}-22_amd64.deb"
#https://www.signalyst.eu/bins/hqplayer/bionic/hqplayer4desktop_4.4.0-19_amd64.deb

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"
IUSE="manual"

RDEPEND=">=sys-devel/gcc-5.1.0[openmp]
	>=media-libs/alsa-lib-1.0.16
	>=media-libs/flac-1.3.0
	>=dev-qt/qtcore-5.5.0
	>=dev-qt/qtgui-5.5.0
	>=dev-qt/qtwidgets-5.5.0
	>=dev-qt/qtnetwork-5.5.0
	>=dev-qt/qtdeclarative-5.5.0
	>=net-libs/libmicrohttpd-0.9.62
	>=dev-qt/qtquickcontrols2-5.11.3
	manual? ( app-text/evince )"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqp-control usr/bin/hqplayer"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv usr "${D}" || die
	insinto "/usr/share/applications/"
	doins "${FILESDIR}/hqplayer4desktop-manual.desktop"
}
