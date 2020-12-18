# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="GitHub Desktop is an open source Electron-based GitHub app"
HOMEPAGE="https://desktop.github.com/"
#SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/${MY_PN}-amd64.deb"
SRC_URI="https://github.com/shiftkey/desktop/releases/download/release-${PV}-linux2/GitHubDesktop-linux-${PV}-linux2.deb"
#SRC_URI="https://github.com/shiftkey/desktop/releases/download/release-2.4.0-linux1/GitHubDesktop-linux-2.4.0-linux1.deb"

LICENSE="GitHub"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=gnome-base/gconf-3.2.6-r4 
	>=x11-libs/libnotify-0.7.8
	>=dev-libs/libappindicator-12.10.0-r301
	>=x11-libs/libXtst-1.2.3-r1
	>=dev-libs/nss-3.51
	>=net-misc/curl-7.68.0
	>=app-crypt/libsecret-0.18.8
	>=gnome-base/gnome-keyring-3.31.91-r1"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="opt/'GitHub Desktop'/github-desktop"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv usr opt "${D}" || die
}
