# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KDE libraries needed by all KDE programs."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="mirror://trinity/${PV}/${P}.tar.gz"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="arts gsm jingle speex webcam +kopete_protocol_oscar +kopete_plugin_history"

SLOT="3.5"

RDEPEND="kde-base/kdelibs:3.5
	net-libs/meanwhile
    net-libs/libgadu"

DEPEND="${RDEPEND}
    dev-util/cmake
    dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
	export PATH=/usr/kde/3.5/bin:$PATH
	export QTDIR=/usr/qt/3
	export KDEDIR=/usr/kde/3.5
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DWITH_LIBIDN=ON
		-DWITH_SSL=ON
		-DWITH_LIBART=ON
		$(cmake-utils_use_with arts ARTS)
		$(cmake-utils_use_with gsm GSM)
		$(cmake-utils_use_with jingle JINGLE)
		$(cmake-utils_use_with speex SPEEX)
		$(cmake-utils_use_with webcam WEBCAM)
		$(cmake-utils_use_build kopete_protocol_oscar)
		$(cmake-utils_use_build kopete_plugin_history)
		-DBUILD_ALL=ON
		-DQTDIR=/usr/include/qt4
	)

	cmake-utils_src_configure
}
