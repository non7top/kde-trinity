# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2 or later
# $Header: $

EAPI=2
inherit kde versionator

DESCRIPTION="Make your Kicker (the KDE main panel) rock with your music."
HOMEPAGE="http://www.kde-apps.org/content/show.php?content=52869"
SRC_URI="http://slaout.linux62.org/kirocker/downloads/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/amarok:3.5"
RDEPEND=""

need-kde 3.2

PATCHES="${FILESDIR}/${P}-desktop.patch
	${FILESDIR}/trinity.patch
	${FILESDIR}/linker.patch"

	export PATH=/usr/kde/3.5/bin:$PATH
	export QTDIR=/usr/qt/3
	export KDEDIR=/usr/kde/3.5
src_compile() {
	set-kdedir
	export PREFIX="${KDEDIR}"
	local myconf=""
	myconf="${myconf} --with-extra-includes=/usr/include/tqt"
	kde_src_compile
}
