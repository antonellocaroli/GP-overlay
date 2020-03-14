EAPI=6
inherit


DESCRIPTION="music player"
HOMEPAGE="https://roonlabs.com/index.html"
SRC_URI="https://github.com/MilhouseVH/bcmstat/archive/${PV}.tar.gz"



LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~arm64"
#media-libs/libao

DEPEND=""

S="${WORKDIR}"




src_install() {
   cp -R "${D}bcmstat.sh" "${D}/usr/bin/" || die "Install failed!"
}

pkg_postinst()
{
        chmod +x /usr/bin/bcmstat.sh
}
