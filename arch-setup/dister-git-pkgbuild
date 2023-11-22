# Maintainer: vccrurial <craigtusspot@gmail.com>

pkgname=dister-git
_pkgname=dister
pkgver=r68.7ec492e
pkgrel=1
pkgdesc="Dister is a tool that aims at mimicking what NixOS does (reproducibility), for any Linux distribution."
arch=('x86_64')
url="https://gitlab.com/Oglo12/$_pkgname"
license=('GPL')
makedepends=('cargo' 'git')
provides=(dister)
conflicts=(dister)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	  cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	  cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	  cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
