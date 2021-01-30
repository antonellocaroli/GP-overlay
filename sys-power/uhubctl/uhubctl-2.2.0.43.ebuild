# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="uhubctl is utility to control USB power per-port on smart USB hubs"
HOMEPAGE="https://github.com/mvp/uhubctl"

EGIT_REPO_URI="https://github.com/mvp/uhubctl.git"
EGIT_COMMIT="91035987e48e302453e9a376b4c646e906cf8318"
# see VERSION #def in squeezelite.h

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"
IUSE=""

# ffmpeg provides alac and wma codecs
DEPEND="dev-libs/libusb
	dev-libs/libusb-compat"
RDEPEND="${DEPEND}"



src_compile() {
make
}

src_install() {
  dobin uhubctl
}
