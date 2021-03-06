# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1 git-r3

DESCRIPTION="Companion Python library for plotting configurations and filters for CamillaDSP"
HOMEPAGE="https://github.com/HEnquist/pycamilladsp"

EGIT_REPO_URI="https://github.com/HEnquist/pycamilladsp-plot.git"
EGIT_COMMIT="af3e3bcaf17243d9eec8b81bf8783f84e0183416"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"


RDEPEND="dev-python/jsonschema
dev-python/numpy
dev-python/matplotlib
dev-python/pyyaml"
DEPEND="${RDEPEND}"
