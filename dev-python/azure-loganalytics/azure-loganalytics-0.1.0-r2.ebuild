# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure log analytics client library for Python"
HOMEPAGE="https://pypi.org/project/azure-loganalytics"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="MIT"
SLOT="0"

RDEPEND=">=dev-python/msrestazure-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/azure-common-1.1.27[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install() {
	distutils-r1_python_install

	# __init__.py are provided by net-misc/azure-cli
	rm "${ED}$(python_get_sitedir)/azure/__init__.py" || die

	# Avoid portage file collisions
	rm -r "${ED}$(python_get_sitedir)/azure/__pycache__" || die
}
