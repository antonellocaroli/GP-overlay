# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Resource efficient UPnP/DLNA renderer"
HOMEPAGE="https://github.com/hzeller/gmrender-resurrect"
EGIT_REPO_URI="https://github.com/hzeller/gmrender-resurrect.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE=""

DEPEND="
	net-libs/libupnp
	dev-libs/glib:2
	media-libs/gstreamer:1.0
  media-libs/gst-plugins-base:1.0
  media-libs/gst-plugins-good:1.0
  media-libs/gst-plugins-bad:1.0
  media-libs/gst-plugins-ugly:1.0
  media-plugins/gst-plugins-soup:1.0
  media-plugins/gst-plugins-libav:1.0
"
RDEPEND="${DEPEND}"

src_prepare() {
  default
	eautoreconf
}

src_install() {
  default
	newconfd "${FILESDIR}/gmediarender.conf.d" "gmediarender"
	newinitd "${FILESDIR}/gmediarender.init.d" "gmediarender"
}
