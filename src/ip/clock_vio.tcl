create_ip -name vio -vendor xilinx.com -library ip -version 3.0 -module_name clock_vio
set_property -dict [list \
  CONFIG.C_NUM_PROBE_IN {15} \
  CONFIG.C_NUM_PROBE_OUT {2} \
  CONFIG.C_PROBE_IN0_WIDTH {32} \
  CONFIG.C_PROBE_IN1_WIDTH {32} \
  CONFIG.C_PROBE_IN2_WIDTH {32} \
  CONFIG.C_PROBE_IN3_WIDTH {32} \
  CONFIG.C_PROBE_IN4_WIDTH {32} \
  CONFIG.C_PROBE_IN5_WIDTH {32} \
  CONFIG.C_PROBE_IN6_WIDTH {32} \
  CONFIG.C_PROBE_IN7_WIDTH {32} \
  CONFIG.C_PROBE_IN8_WIDTH {32} \
  CONFIG.C_PROBE_IN9_WIDTH {32} \
  CONFIG.C_PROBE_IN10_WIDTH {32} \
  CONFIG.C_PROBE_IN11_WIDTH {32} \
  CONFIG.C_PROBE_IN12_WIDTH {32} \
  CONFIG.C_PROBE_IN13_WIDTH {32} \
  CONFIG.C_PROBE_IN14_WIDTH {32} \
] [get_ips clock_vio]
generate_target all [get_files $BUILD_DIR/PAndA2_IOtest.srcs/sources_1/ip/clock_vio/clock_vio.xci]

