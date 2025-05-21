APT += gcc-i686-linux-gnu
APT += linux-source-$(LINUX_VER) uclibc-source gcc-$(GCC_VER)-source

OS   ?= linux
QEMU  = qemu-system-i386
