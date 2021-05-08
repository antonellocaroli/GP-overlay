# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit git-r3

DESCRIPTION="This is an ALSA I/O plugin for use with CamillaDSP for audio playback"
HOMEPAGE="https://github.com/scripple/alsa_cdsp"

EGIT_REPO_URI="https://github.com/scripple/alsa_cdsp.git"
EGIT_COMMIT="bbf06dd941b9225aa1f675acdbdf75a2b1516046"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"


RDEPEND=""
DEPEND="${RDEPEND}"

#PATCHES=(
#	"${FILESDIR}/${P}.patch"
#)
src_prepare() {
  default
}

src_install() {
  make DESTDIR=${D} install || die "Install Failed"
}
