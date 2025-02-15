# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils kde-functions
set-kdedir 3.5

DESCRIPTION="KCMInit - runs startups initialization for Control Modules."
HOMEPAGE="http://trinity.pearsoncomputing.net/"
SRC_URI="mirror://trinity/${PV}/kdebase-${PV}.tar.gz"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86"
IUSE=""


SLOT="3.5"

RDEPEND="x11-libs/libX11
    x11-libs/libXext
    x11-libs/libXrender
    x11-libs/libXtst
    kde-base/kdelibs:${SLOT}"

DEPEND="${RDEPEND}"

S=${WORKDIR}/kdebase

src_configure() {
        mycmakeargs=(
                -DBUILD_KCMINIT=ON
        )

        cmake-utils_src_configure
}
