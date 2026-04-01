maintainer="osty"
pkgname="btop-s"
pkgver="1.4.6"
pkgrel=1
pkgdesc="Monitor de recursos moderno (C++) - v3 para 15IKBR"
arch=("amd64")
url="https://github.com/aristocratos/btop"
source=("git+https://github.com/aristocratos/btop")
license=("Apache-2.0")
depends=("build-essential" "gcc" "g++" "coreutils" "sed" "git")
provides=("btop")
conflicts=("btop" "btop-bin")

build() {
    cd "${srcdir}/btop"
    # Forçando explicitamente a otimização v3 e o uso de todos os cores
    export CFLAGS="-march=x86-64-v3 -O3 -pipe"
    export CXXFLAGS="-march=x86-64-v3 -O3 -pipe"
    
    make ADDFLAGS="-march=x86-64-v3"
}

package() {
    cd "${srcdir}/btop"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
