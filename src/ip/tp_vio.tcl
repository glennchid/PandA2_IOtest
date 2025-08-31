create_ip -name vio -vendor xilinx.com -library ip -version 3.0 -module_name tp_vio
set_property -dict [list \
  CONFIG.C_NUM_PROBE_IN {12} \
  CONFIG.C_NUM_PROBE_OUT {10} \
  CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
] [get_ips tp_vio]
generate_target all [get_files $BUILD_DIR/PAndA2_IOtest.srcs/sources_1/ip/tp_vio/tp_vio.xci]

