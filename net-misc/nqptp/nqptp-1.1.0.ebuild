# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user git-r3

MY_PN="nqptp"

DESCRIPTION="nqptp is a daemon that monitors timing data from any PTP clocks"
HOMEPAGE="https://github.com/mikebrady/nqptp"
#EGIT_REPO_URI="https://github.com/antonellocaroli/nqptp.git"
#EGIT_COMMIT="f777d7297b7587d4eea2948a887ce203a9b1fc57"
EGIT_REPO_URI="https://github.com/mikebrady/nqptp.git"
EGIT_COMMIT="2caa1944ca44a5a365b5904f82038a9425c755b8"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
#media-libs/libao

DEPEND=""
RDEPEND="${DEPEND}"

#PATCHES=(
#	"${FILESDIR}/make.patch"
#)

#S="${WORKDIR}/${MY_PN}"

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
