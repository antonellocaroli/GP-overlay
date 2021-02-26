# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eapi7-ver rpm

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="https://www.signalyst.eu/bins/hqplayer/fc33/${MY_PN}-${PV}-16.fc33.x86_64.rpm"
#        https://www.signalyst.eu/bins/hqplayer/fc33/hqplayer4client-4.8.0-16.fc33.x86_64.rpm

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror bindist"

RDEPEND=">=sys-devel/gcc-5.1.0[openmp]
  >=app-arch/rpm-4.16.0
	>=dev-qt/qtcore-5.5.0
	>=dev-qt/qtgui-5.5.0
	>=dev-qt/qtnetwork-5.5.0
	>=dev-qt/qtdeclarative-5.5.0
	>=dev-qt/qtquickcontrols2-5.11.3"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqplayer4client"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	mv usr "${D}" || die
}
