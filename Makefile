TOP := $(CURDIR)

SHELL = /bin/bash

export VIVADO := /dls_sw/FPGA/Xilinx/Vivado/2023.2/settings64.sh

BUILD_DIR = $(TOP)/impl
SOURCE_DIR = $(TOP)/src
BUILD_SCR = $(TOP)/PandA2_IOtest.tcl
VIVADO_PROJ = $(BUILD_DIR)/PandA2_IOtest.xpr

fpga-bit:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); \
	. $(VIVADO); \
	time vivado -mode batch -source $(BUILD_SCR) -log build.log -nojournal -tclargs $(SOURCE_DIR) -tclargs $(BUILD_DIR)
.PHONY : fpga-bit

run-vivado: | $(VIVADO_PROJ)
	cd $(BUILD_DIR); \
	. $(VIVADO); \
	vivado $(VIVADO_PROJ)
.PHONY: run-vivado

$(VIVADO_PROJ) :
	$(MAKE)

clean: 
	rm -rf $(BUILD_DIR)
.PHONY: clean



