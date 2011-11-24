# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="Kicker is the KDE application starter panel, also capable of some useful applets and extensions."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="mirror://trinity/${PV}/kdebase-${PV}.tar.gz"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE="xcomposite"

SLOT="3.5"

RDEPEND="kde-base/libkonq:${SLOT}
    x11-libs/libXrender
    x11-libs/libXfixes
    xcomposite? ( x11-libs/libXcomposite )"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdebase

src_configure() {
	export PATH=/usr/kde/3.5/bin:$PATH
	export QTDIR=/usr/qt/3
	export KDEDIR=/usr/kde/3.5
	mycmakeargs=(
		-DCMAKE_INSTALL_RPATH=/usr/kde/3.5/lib
		-DBUILD_KICKER=ON
		$(cmake-utils_use_with xcomposite XCOMPOSITE)
	)

	cmake-utils_src_configure
}
