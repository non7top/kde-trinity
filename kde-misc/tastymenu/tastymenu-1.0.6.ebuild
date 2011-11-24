# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Tasty Menu Gentoo ebuild by franzf (http://www.alpine-art.de/)

EAPI="3"

inherit kde versionator

DESCRIPTION="KMenu Replacement."
HOMEPAGE="http://www.kde-look.org/content/show.php?content=41866"
SRC_URI="http://www.notmart.org/files/${P}.tar.bz2"
LICENSE="GPL-2"

RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( kde-base/kicker:3.5 kde-base/kdebase:3.5 )"

need-kde 3.3

PATCHES="${FILESDIR}/trinity.patch"

	export PATH=/usr/kde/3.5/bin:$PATH
	export QTDIR=/usr/qt/3
	export KDEDIR=/usr/kde/3.5
src_compile() {
	set-kdedir
	export PREFIX="${KDEDIR}"
	local myconf=""
	myconf="${myconf} --without-arts"
	kde_src_compile
}
