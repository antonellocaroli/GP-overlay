# Copyright 2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI=7

inherit systemd unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer Embedded - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="
amd64? ( !cpu_flags_x86_avx2? ( https://www.signalyst.eu/bins/hqplayerd/focal/${MY_PN}_${PV}-69_amd64.deb ) )
amd64? ( cpu_flags_x86_avx2? ( https://www.signalyst.eu/bins/hqplayerd/focal/${MY_PN}_${PV}-70amd_amd64.deb ) )
"

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

IUSE="systemd cpu_flags_x86_avx2"

RDEPEND=">=dev-libs/glib-2.37.3
	>=media-libs/libgmpris-2.2.1
	>=media-libs/alsa-lib-1.0.16
	>=media-libs/flac-1.3.0
	>=media-libs/libogg-1.3.3
	>=net-misc/rygel-0.34.0
	>=sys-libs/libomp-7.1.0
  >=net-libs/gupnp-1.0.4
  >=net-libs/gupnp-av-0.12.11
	>=dev-libs/libgee-0.20.2
	>=dev-util/patchelf-0.10
	>=net-libs/libsoup-2.62.3
	>=media-sound/wavpack-5.3.2-r1
	x11-libs/cairo"

DEPEND="${RDEPEND}"

#BDEPEND=">=dev-util/patchelf-0.10"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqplayerd"


#pkg_setup() {
#	if use !systemd; then
#		enewgroup hqplayerd
#		enewuser hqplayerd -1 -1 "/dev/null" "hqplayerd,audio"
#	fi
#}

src_prepare() {
     default
       patchelf --replace-needed libomp.so.5 libomp.so usr/bin/hqplayerd || die
       patchelf --replace-needed libgupnp-1.0.so.4 libgupnp-1.2.so.0 usr/bin/hqplayerd || die
}

src_install() {
	mv etc usr var "${D}" || die
	rm "${D}usr/share/doc/hqplayerd/changelog.Debian.gz"
	if use systemd; then
		systemd_dounit "${FILESDIR}/${MY_PN}.service"
	else
		newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
	fi
}

pkg_postinst() {
	# Provide some post-installation tips.
	elog ""
	elog ""
	elog ""
  elog "HQPlayer Embedded can be started with the following command (OpenRC):"
  elog "\t/etc/init.d/hqplayerd start"
  elog "or (systemd):"
  elog "\tsystemctl start hqplayerd"
  elog ""
  elog "HQPlayer Embedded can be automatically started on each boot"
  elog "with the following command (OpenRC):"
  elog "\trc-update add hqplayerd default"
  elog "or (systemd):"
  elog "\tsystemctl enable hqplayerd"
  elog ""
  elog ""
	elog ""
	elog "Please change the password as soon as possible, either through the web interface,"
	elog "or from command line using command:"
	elog "\thqplayerd -s root gentooplayer"
	elog ""
	elog ""
	elog "web interface:"
	elog "\tip:8088"
	elog ""
	}
