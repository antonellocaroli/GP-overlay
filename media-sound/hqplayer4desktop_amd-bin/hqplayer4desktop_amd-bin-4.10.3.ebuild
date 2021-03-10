# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker user

MY_PN=${PN/_amd-bin/}

DESCRIPTION="HQPlayer - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="http://www.signalyst.eu/bins/hqplayer/focal/${MY_PN}_${PV}-38amd_amd64.deb"
#https://www.signalyst.eu/bins/hqplayer/focal/hqplayer4desktop_4.10.0-32amd_amd64.deb
#https://www.signalyst.eu/bins/hqplayer/bionic/hqplayer4desktop_4.4.0-19_amd64.deb

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"
IUSE="manual client"

RDEPEND=">=sys-devel/gcc-5.1.0[openmp]
	>=media-libs/alsa-lib-1.0.16
	>=media-libs/flac-1.3.0
	>=dev-qt/qtcore-5.5.0
	>=dev-qt/qtgui-5.5.0
	>=dev-qt/qtwidgets-5.5.0
	>=dev-qt/qtnetwork-5.5.0
	>=dev-qt/qtdeclarative-5.5.0
	>=dev-qt/qtscript-5.15.1
	>=dev-qt/qtsql-5.15.1
	>=dev-qt/qtsvg-5.15.1
	>=dev-qt/qtcharts-5.15.1
	>=net-libs/libmicrohttpd-0.9.62
	>=dev-qt/qtquickcontrols2-5.11.3
	manual? ( app-text/evince )
	client? ( media-sound/hqplayer4client-bin )
	>=sys-libs/libomp-7.1.0
	>=dev-util/patchelf-0.10"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqp-control2 usr/bin/hqplayer4client usr/bin/haqplayer4desktop"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	patchelf --replace-needed libomp.so.5 libomp.so usr/bin/hqplayer4desktop || die
	rm -rf usr/bin/hqplayer4client
	rm -rf usr/share/applications/hqplayer4-client.desktop
	rm -rf usr/share/pixmaps/hqplayer4-client.png
	default
}

src_install() {
	mv usr "${D}" || die
	insinto "/usr/share/applications/"
	doins "${FILESDIR}/hqplayer4desktop-manual.desktop"
}
