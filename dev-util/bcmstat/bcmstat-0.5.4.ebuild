EAPI=6
inherit

MY_PN="bcmstat"
DESCRIPTION="music player"
HOMEPAGE="https://roonlabs.com/index.html"
SRC_URI="https://github.com/MilhouseVH/bcmstat/archive/${PV}.tar.gz"



LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~arm64"
#media-libs/libao

DEPEND=""

S="${WORKDIR}"
#S="${WORKDIR}/${MY_PN}-${PV}"




src_install() {
   cp "bcmstat.sh" "/usr/bin/" || die "Install failed!"
}

pkg_postinst()
{
        chmod +x /usr/bin/bcmstat.sh
}
