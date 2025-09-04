# PandA2_IOtester

Simple IO tester for the PandABox-II platform.

Allows reading or driving IO signals using VIO cores. Bidirectional IOs can be read by default, but can be driven by setting the appropriate tri-state enable low. Note that signal driven by line-driver/reciever ICs may also need the appropriate DE/RE control set for the signal to be output.

## Instructions for building

Type `make` to build the FPGA bitstream.

Type `make run-vivado` to open the project in Vivado and connect to the FPGA via JTAG (will also build the bitstream if not done before).

## Instructions for running

125 MHz fabric clock requires configuration by the FSBL.

Prepare SD card with Zynqmp rootfs files from:

https://github.com/PandABlocks/PandABlocks-rootfs/releases/tag/4.0

The FSBL and devicetree for the XU1 are the same as for the XU5 and can be found here (boot@xu5_st1.zip):

https://github.com/PandABlocks/PandABlocks-FPGA/releases/tag/4.0

No other zpkgs are necessary, but a customised config.txt and ssh keys in `/boot` are useful for connecting via ethernet.

The bitstream needs to be loaded by the `fpga_manager` on the ZynqPS, for the 125 MHz fabric clock to be output from the PS.
Copy the FPGA bitstream to the `/opt/firmware` directory on the ZynqPS (the directory may need to be created first): eg 

`ssh PandA2_IOtester.bit 192.168.0.2:/opt/firmware`

Load the firmware using `fpga_manger`:

`root@panda:~# echo PandA2_IOtest.bit > /sys/class/fpga_manager/fpga0/firmware` 

Connect to the FPGA via JTAG from Vivado Hardware Manager and specify the probes file : `PandA2_IOtest.ltx`

## Core Description

The design consists of five VIO cores. For bidirectional IOs the tri_en signal (eg `enc_tri_en`) determines the direction for all the inout signals in that VIO group, defaulting to high (inputs). Output signals with the `_sig` suffix are the driven values (when tri-state disabled), and the non-suffixed versions are the read values.

- Encoder board

IO to the rear panel board (assumed to be the encoder board) - all IOs bidirectional. AENC<1-8>, B_CLKENC<1-8>, Z_DATAENC<1-8>

- DIO board

IO for the front panel board (assumed to be the DIO board ) - all bidir. PANEL_F_IO_<0-7>, PANEL_F_SPARE_<0-8>

- Test points, Fan Tacho, LED

TP<46-53> (bidir), FAN_TACH<0-3> (inputs), XU1 PL LED (LED2_N_PWR_SYNC - output) 

- 1.8V DIO and LVDS

PANEL_F_DI_<0-1>, LVDS<0-1>_R (inputs); PANEL_F_DO_<0-1>, LVDS_DIR<0-1>, LVDS<0-1>_D (outputs)

- Clock Testing

Default frequencies for on-board clocks (all inputs). MGTREF_CLK<0-7>, FMC_CLK<0-3>, EXT_CLK, WR_CLK, CLK20
All frequencies measured in units of the PS clock frequency (nominally 125 MHz) divided by 8192.


