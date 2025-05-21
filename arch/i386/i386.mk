APT += gcc-i686-linux-gnu
APT += linux-source-$(LINUX_VER) uclibc-source gcc-$(GCC_VER)-source

QEMU      = qemu-system-i386
QEMU_CFG += -m 1M -machine pc -cpu 486
