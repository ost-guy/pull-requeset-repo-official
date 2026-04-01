maintainer="osty <seu@email.com>"
pkgname="btop-git"
pkgver="1.4.0"
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
    # Aqui o seu i7 vai usar o -j9 do config.fish
    make
}

package() {
    cd "${srcdir}/btop"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
