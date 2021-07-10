# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user git-r3

MY_PN="shairport-sync"

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
EGIT_REPO_URI="https://github.com/mikebrady/shairport-sync.git"
EGIT_COMMIT="dda615975de21abec41140923a58f9bc2ec79601"
EGIT_REPO_URI="https://github.com/mikebrady/nqptp.git"
EGIT_COMMIT="2caa1944ca44a5a365b5904f82038a9425c755b8"


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

#S="${WORKDIR}/${MY_PN}"

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
