EAPI=6
inherit

MY_PN="bcmstat"
DESCRIPTION="rpi util"
HOMEPAGE="https://github.com/MilhouseVH/bcmstat"
SRC_URI="https://github.com/MilhouseVH/bcmstat/archive/${PV}.tar.gz"



LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~arm64"
#media-libs/libao

DEPEND=""

S="${WORKDIR}"
#S="${WORKDIR}/${MY_PN}-${PV}"




src_install() {
   dobin ${MY_PN}-${PV}/bcmstat.sh
}

#pkg_postinst()
##{
#        chmod +x /usr/bin/bcmstat.sh
#}
