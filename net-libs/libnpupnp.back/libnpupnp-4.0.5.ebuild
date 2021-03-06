# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="UPnP base library, replacement for libupnp a.k.a. pupnp"
HOMEPAGE="https://www.lesbonscomptes.com/upmpdcli"
SRC_URI="https://www.lesbonscomptes.com/upmpdcli/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-libs/expat
	net-misc/curl
"
RDEPEND="${DEPEND}"

src_compile() {
    ./configure --prefix=/usr --libdir=/usr/lib64
    make
}

src_install() {
	emake DESTDIR="${D}" install
}
