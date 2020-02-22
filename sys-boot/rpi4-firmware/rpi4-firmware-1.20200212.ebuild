# Copyright (c) 2018 sakaki <sakaki@deciban.com>
# License: GPL v3+
# NO WARRANTY

EAPI=6

DESCRIPTION="Raspberry PI boot loader and firmware, for 64-bit mode"
HOMEPAGE="https://github.com/raspberrypi/firmware"
UPSTREAM_PV="${PV/_p/+}"
DOWNLOAD_PV="${PV/_p/-}"
SRC_URI="https://github.com/antonellocaroli/rpi4-firmware/releases/download/${UPSTREAM_PV}/${UPSTREAM_PV}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-2 raspberrypi-videocore-bin Broadcom"
SLOT="0"
KEYWORDS="~arm64"
IUSE="pitop +dtbo"
RESTRICT="mirror binchecks strip"

DEPEND=""
RDEPEND="
	${DEPEND}"

#S="${WORKDIR}/rpi4-firmware-${DOWNLOAD_PV}"
S="${WORKDIR}"

pkg_preinst() {
	if ! grep "${ROOT%/}/boot" /proc/mounts >/dev/null 2>&1; then
		ewarn "${ROOT%/}/boot is not mounted, the files might not be installed at the right place"
	fi
}

src_install() {
	cd boot
	insinto /boot
	doins *.elf
	# allow for the dtbos to be provided by the kernel package
	if use dtbo; then
		doins -r overlays
	fi
	doins *.bin
	doins *.dat
	doins *.broadcom
	# assume /boot/cmdline.txt and /boot/config.txt now
	# provided by rpi3-boot-config package;
	# assume kernel and dtbs are provided separately
	# e.g. by sys-kernel/bcmrpi3-kernel-bin package
}
