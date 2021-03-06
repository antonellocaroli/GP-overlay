# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="The libupnpp C++ library wraps libnpupnp for easier use by upmpdcli and upplay"
HOMEPAGE="https://www.lesbonscomptes.com/upmpdcli"
SRC_URI="https://www.lesbonscomptes.com/upmpdcli/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"

DEPEND="
	dev-libs/expat
	net-misc/curl
	>=net-libs/libnpupnp-4.0.14
"
RDEPEND="${DEPEND}"

src_compile() {
	 if use arm ; then
    ./configure --prefix=/usr --libdir=/usr/lib
	 else
		./configure --prefix=/usr --libdir=/usr/lib64
	 fi
    make
}

src_install() {
	emake DESTDIR="${D}" install
}
