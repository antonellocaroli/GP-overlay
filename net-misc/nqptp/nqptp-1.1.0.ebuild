# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user git-r3

MY_PN="nqptp"

DESCRIPTION="nqptp is a daemon that monitors timing data from any PTP clocks"
HOMEPAGE="https://github.com/mikebrady/nqptp"
EGIT_REPO_URI="https://github.com/antonellocaroli/nqptp.git"
EGIT_COMMIT="f777d7297b7587d4eea2948a887ce203a9b1fc57"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
#media-libs/libao

DEPEND=""
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${MY_PN}"

PATCHES=(
	"${FILESDIR}/make.patch"
)

src_compile() {
        #default
        autoreconf -fi
				./configure
				make
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}"/${MY_PN}.initd ${MY_PN}
}
