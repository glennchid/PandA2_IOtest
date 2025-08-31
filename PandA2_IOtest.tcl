set SOURCE_DIR [lindex $argv 0]
set BUILD_DIR  [lindex $argv 1]

create_project -f PandA2_IOtest $BUILD_DIR -part xczu6cg-ffvc900-1-e

set_property target_language VHDL [current_project]

add_files -norecurse $SOURCE_DIR/const/PandA2_IOtest.xdc
set_property used_in_synthesis false [get_files $SOURCE_DIR/const/PandA2_IOtest.xdc]

add_files [glob $SOURCE_DIR/hdl/*.vhd]
set_property file_type {VHDL 2019} [get_files  $SOURCE_DIR/hdl/PandA2_IOtest.vhd]

source $SOURCE_DIR/bd/barePS.tcl
set design_name [get_bd_designs]
make_wrapper -files [get_files $design_name.bd] -top -import

foreach IP [glob $SOURCE_DIR/ip/*.tcl] {
    source $IP
}

launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -jobs 4
wait_on_run impl_1

open_run impl_1

set timingreport \
    [report_timing_summary -no_header -no_detailed_paths -return_string \
        -file post_route_timing_summary.rpt]

if {! [string match -nocase {*timing constraints are met*} $timingreport]} {
    send_msg_id showstopper-0 error "Timing constraints weren't met."
    return -code error
}

write_bitstream -force PandA2_IOtest
write_debug_probes -force PandA2_IOtest

