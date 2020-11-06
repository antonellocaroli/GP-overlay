# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit


DESCRIPTION="software based on CamillaDSP and SoX to do offline batch audio file convertion, upsampling and convolution"
HOMEPAGE="https://audiodigitale.eu/"
SRC_URI="https://audiodigitale.eu/repo/ycld/${PN}-${PV}.tar.gz"




LICENSE="Simone Filippini"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="virtual/jre:1.8
	media-sound/camilladsp-bin"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
        insinto "/opt/${PN}/"
        doins YCLD.jar
        dodir "/opt/${PN}/config"
        insinto "/opt/${PN}/config"
        newins "${FILESDIR}/config.properties-${PV}" "config.properties"
}
