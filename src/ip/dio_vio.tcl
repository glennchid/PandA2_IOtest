create_ip -name vio -vendor xilinx.com -library ip -version 3.0 -module_name dio_vio
set_property -dict [list \
  CONFIG.C_NUM_PROBE_IN {19} \
  CONFIG.C_NUM_PROBE_OUT {20} \
  CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
] [get_ips dio_vio]
generate_target all [get_files $BUILD_DIR/PAndA2_IOtest.srcs/sources_1/ip/dio_vio/dio_vio.xci]

