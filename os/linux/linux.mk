ifeq ($(ARCH),i386)
APT += linux-source gcc-12-source

GZ += ref/uclibc-$(UCLIBC_VER)/README
ref/uclibc-$(UCLIBC_VER)/README:
	cd ref ; apt source uclibc

GZ += ref/busybox-$(BB_VER)/README
ref/busybox-$(BB_VER)/README:
	cd ref ; apt source busybox

cd ref ; apt source linux-source
endif

LINUX_CFG += $(CWD)/hw/all.linux
LINUX_CFG += $(CWD)/arch/$(ARCH)/$(ARCH).linux
LINUX_CFG += $(CWD)/cpu/$(CPU)/$(CPU).linux
LINUX_CFG += $(CWD)/hw/$(HW)/$(HW).linux

LINUX_MK = ref/linux-source-$(LINUX_VER)/Makefile

.PHONY: linux
linux: tmp/kernel/.config $(LINUX_MK)
