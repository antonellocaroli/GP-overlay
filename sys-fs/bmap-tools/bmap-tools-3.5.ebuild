# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_7,3_8} )
inherit distutils-r1 git-r3

DESCRIPTION="Create and apply sparse images of block devices"
HOMEPAGE="https://source.tizen.org/documentation/reference/bmaptool/bmap-tools-project"
EGIT_REPO_URI="https://github.com/intel/bmap-tools.git"
EGIT_COMMIT="1c48e2b1ac5d24ac44b405c6607260365e476ea3"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
S="${S}"

src_install()
{
   distutils-r1_src_install
}
