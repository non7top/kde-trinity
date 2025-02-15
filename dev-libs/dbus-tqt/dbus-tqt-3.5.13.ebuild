# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="Interface and abstraction library for Qt and Trinity"
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="mirror://trinity/${PV}/dependencies/${P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="+qt3 -qt4"

SLOT="3.5"

RDEPEND="qt3? ( x11-libs/qt:3 )
    qt4? ( x11-libs/qt-meta:4 )"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/dependencies/${PN}

src_configure() {
	mycmakeargs=(
	    $(cmake-utils_use qt3 USE_QT3)
	    $(cmake-utils_use qt4 USE_QT4)
	 )

	 cmake-utils_src_configure
}

