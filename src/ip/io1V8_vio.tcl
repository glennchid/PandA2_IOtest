create_ip -name vio -vendor xilinx.com -library ip -version 3.0 -module_name io1V8_vio
set_property -dict [list \
  CONFIG.C_NUM_PROBE_IN {4} \
  CONFIG.C_NUM_PROBE_OUT {6} \
] [get_ips io1V8_vio]
generate_target all [get_files $BUILD_DIR/PAndA2_IOtest.srcs/sources_1/ip/io1V8_vio/io1V8_vio.xci]

