# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 autotools

DESCRIPTION="ibus-libpinyin - pinyin chinese input for ibus using libpinyin"
HOMEPAGE="https://github.com/libpinyin/ibus-libpinyin"
EGIT_REPO_URI="https://github.com/libpinyin/ibus-libpinyin.git"
EGIT_COMMIT="737fdaa6a118729e20378245dbb8af0c142fa187"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="boost opencc lua"

DEPEND=""
RDEPEND=">=app-i18n/ibus-1.4
	>=app-i18n/libpinyin-1.0.0
	dev-python/pygtk
	app-i18n/pyzy
	boost? ( >=dev-libs/boost-1.39 )
	lua? ( >=dev-lang/lua-5.1 )"

src_prepare() {
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

src_install() {
	emake DESTDIR="${D}" install
	dodoc
}
