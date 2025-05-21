HW ?= pc
# HW ?= qemu386

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

ifeq ($(ARCH),i386)
.PHONY: qemu
qemu: bin/$(BINFILE).iso
	$(QEMU) $(QEMU_CFG) -gdb tcp::12345 -boot d -cdrom $<
endif
