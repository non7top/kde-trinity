# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="kpdf, a kde pdf viewer based on xpdf"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="http://www.thel.ro/distfiles/kdegraphics-3.5.13_p1183307.tar.bz2"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE=""

SLOT="3.5"

RDEPEND="kde-base/kdelibs
    >=media-libs/freetype-2.3
    media-libs/t1lib
    app-text/libpaper"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/kdegraphics

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DWITH_LIBPAPER=ON
		-DBUILD_KPDF=ON
	)

	cmake-utils_src_configure
}
