# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop rpm

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="https://www.signalyst.eu/bins/hqplayer/fc33/${MY_PN}-${PV}-16.fc33.x86_64.rpm"

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror bindist"

RDEPEND="
    sys-devel/gcc[openmp]
    dev-qt/qtcore:5
    dev-qt/qtgui:5
    dev-qt/qtnetwork:5
    dev-qt/qtdeclarative:5
    dev-qt/qtquickcontrols2:5
"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqplayer4client"

src_install() {
    dobin usr/bin/hqplayer4client
    domenu usr/share/applications/hqplayer4-client.desktop
    doicon usr/share/pixmaps/hqplayer4-client.png
}
