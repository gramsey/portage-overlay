# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/libpinyin/libpinyin-1.0.0.ebuild,v 1.3 2014/08/12 08:15:41 nativemad Exp $

EAPI=5
inherit autotools eutils

MODELV=8

DESCRIPTION="Library for Chinese pinyin input methods"
HOMEPAGE="https://github.com/libpinyin/libpinyin"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar
	http://downloads.sourceforge.net/${PN}/models/model${MODELV}.text.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=sys-libs/db-4*
	dev-libs/glib:2"
DEPEND="${RDEPEND}
	virtual/libintl
	virtual/pkgconfig"

src_prepare() {
	ln -s "${DISTDIR}"/model${MODELV}.text.tar.gz data || die
	sed -e '/wget/d' -i data/Makefile.am || die
	epatch_user
	eautoreconf
}

src_install() {
	default
	prune_libtool_files
}
