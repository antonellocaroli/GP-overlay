# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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

PATCHES=(
	"${FILESDIR}/${P}.patch"
)
src_prepare() {
  default
}

#src_compile() {
#    default
#}

#src_install() {
#     keepdir "/usr/lib64/alsa-lib/"
#     emake install DESTDIR=${D}
#}
src_install() {
    local mypath=/usr/lib64/alsa-lib

    insinto "${mypath}"
    doins libasound_module_pcm_cdsp.so
    insinto /etc/alsa/conf.d
    newins "${FILESDIR}"/camilladsp.conf camilladsp.conf
}
