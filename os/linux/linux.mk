ifeq ($(ARCH),i386)
APT += linux-source gcc-12-source

GZ += ref/uclibc-$(UCLIBC_VER)/README
ref/uclibc-$(UCLIBC_VER)/README:
	cd ref ; apt source uclibc

GZ += ref/busybox-$(BB_VER)/README
ref/busybox-$(BB_VER)/README:
	cd ref ; apt source busybox

LINUX_MK = ref/linux-$(LINUX_VER)/Makefile
GZ += $(LINUX_MK)
$(LINUX_MK):
	cd ref ; apt source linux
endif

LINUX_CFG += hw/all.linux
LINUX_CFG += arch/$(ARCH)/$(ARCH).linux
LINUX_CFG += cpu/$(CPU)/$(CPU).linux
LINUX_CFG += hw/$(HW)/$(HW).linux

LINUX_MAKE  = $(MAKE) -f $(LINUX_MK)
LINUX_MAKE += ARCH=$(ARCH) CROSS_COMPILE=$(LINUX_TARGET)-
LINUX_MAKE += INSTALL_PATH=$(BOOT)
LINUX_MAKE += INSTALL_MOD_PATH=$(ROOT)
LINUX_MAKE += INSTALL_HDR_PATH=$(ROOT)/usr
LINUX_MAKE += INSTALL_DTBS_PATH=$(ROOT)/dtbs

.PHONY: linux
linux: tmp/linux/.config $(LINUX_MK)

tmp/linux/.config: $(LINUX_CFG) mk/cross.mk os/linux/linux.mk
	mkdir -p tmp/linux ; cd tmp/linux ;\
	rm -f .config 
