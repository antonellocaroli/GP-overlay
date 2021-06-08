# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1 git-r3

DESCRIPTION="Companion Python library for CamillaDSP"
HOMEPAGE="https://github.com/HEnquist/pycamilladsp"

EGIT_REPO_URI="https://github.com/HEnquist/pycamilladsp.git"
EGIT_COMMIT="8b64c91411f97d1db9ec5718f40e220ce60f5ec8"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"


RDEPEND="dev-python/websocket-client
dev-python/pyyaml"
DEPEND="${RDEPEND}"
