APT += gcc-i686-linux-gnu
APT += linux-source-$(LINUX_VER) gcc-$(GCC_VER)-source

OS   ?= linux
QEMU  = qemu-system-i386

LINUX_TARGET = i686-linux-gnu
