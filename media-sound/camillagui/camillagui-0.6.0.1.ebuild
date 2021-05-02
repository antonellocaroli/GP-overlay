# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit unpacker eutils user


DESCRIPTION="This is the server part of CamillaGUI, a web-based GUI for CamillaDSP"
HOMEPAGE="https://github.com/HEnquist/camillagui-backend"
SRC_URI="https://github.com/antonellocaroli/${PN}/releases/download/${PN}-${PV}/${PN}-${PV}.tar.gz"


LICENSE="GPL-3"

SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="mirror bindist"

IUSE="systemd"

RDEPEND="dev-python/websocket-client
dev-python/aiohttp
dev-python/matplotlib
dev-python/numpy
dev-python/pycamilladsp
dev-python/pycamilladsp-plot
media-sound/camilladsp"

DEPEND="${RDEPEND}"


S="${WORKDIR}"


src_install() {
  mv camillagui/usr "${D}" || die
  insinto "/opt/${PN}/"
  insopts -m755
  doins -r camillagui/*
  if use systemd; then
      systemd_dounit "${FILESDIR}/camillagui.service"
  else
      newinitd "${FILESDIR}/camillagui.init.d" "camillagui"
  fi
  insinto /etc/alsa/conf.d
  newins "${FILESDIR}"/camilladsp.conf camilladsp.conf
}
