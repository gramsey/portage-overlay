# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit git-r3 autotools python-single-r1

DESCRIPTION="ibus-libpinyin - pinyin chinese input for ibus using libpinyin"
HOMEPAGE="https://github.com/libpinyin/ibus-libpinyin"

EGIT_REPO_URI="https://github.com/libpinyin/ibus-libpinyin.git"
EGIT_COMMIT="737fdaa6a118729e20378245dbb8af0c142fa187"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="boost opencc lua"

DEPEND="sys-apps/sed"
RDEPEND=">=app-i18n/ibus-1.4[python,${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	>=app-i18n/libpinyin-1.0.0
	app-i18n/pyzy
	boost? ( >=dev-libs/boost-1.39 )
	lua? ( >=dev-lang/lua-5.1 )"

DOCS="AUTHORS ChangeLog NEWS README"

src_prepare() {
	sed -i -e "s/python/${EPYTHON}/" setup/ibus-setup-libpinyin.in || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable boost ) \
		$(use_enable opencc ) \
		$(use_enable lua lua-extension ) \
		--enable-english-input-mode
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}
