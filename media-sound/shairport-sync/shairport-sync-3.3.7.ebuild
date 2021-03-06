# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user

MY_PN="shairport-sync"

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
SRC_URI="https://github.com/mikebrady/shairport-sync/archive/${PV}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE="convolution"
#media-libs/libao

DEPEND="dev-libs/openssl
	media-libs/soxr
	dev-libs/libconfig
	dev-libs/libdaemon
	convolution? ( media-libs/libsndfile )"
RDEPEND="${DEPEND}
	net-dns/avahi"

S="${WORKDIR}/${MY_PN}-${PV}"

pkg_setup() {
	enewuser shairport-sync -1 -1 -1 audio
}

src_compile() {
        default
        autoreconf -fi
				if use convolution; then
					./configure --sysconfdir=/etc --with-alsa --with-soxr --with-avahi --with-ssl=openssl --with-libdaemon --with-convolution
				else
				  ./configure --sysconfdir=/etc --with-alsa --with-soxr --with-avahi --with-ssl=openssl --with-libdaemon
				fi
				make
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}"/${MY_PN}.initd ${MY_PN}
}
