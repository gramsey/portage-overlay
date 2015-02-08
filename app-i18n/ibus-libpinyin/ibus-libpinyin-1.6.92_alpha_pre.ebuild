# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="ibus-libpinyin - pinyin chinese input for ibus using libpinyin"
HOMEPAGE="https://github.com/libpinyin/ibus-libpinyin"
EGIT_REPO_URI="https://github.com/libpinyin/ibus-libpinyin.git"
EGIT_COMMIT="737fdaa6a118729e20378245dbb8af0c142fa187"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="boost opencc lua"

DEPEND=""
RDEPEND=">=app-i18n/ibus-1.4
    dev-python/pygtk
    app-i18n/pyzy
    boost? ( >=dev-libs/boost-1.39 )
	lua? ( >=dev-lang/lua-5.1)"

src_prepare() {
	true;	
}

src_configure() {
	econf \
		$(use enable boost ) \
		$(use enable opencc ) \
		$(use enable lua lua-extension ) \
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
