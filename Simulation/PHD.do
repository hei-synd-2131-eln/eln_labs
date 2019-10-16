onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /phd_tb/reset
add wave -noupdate /phd_tb/clock
add wave -noupdate -divider Phases
add wave -noupdate /phd_tb/phaseref
add wave -noupdate /phd_tb/phasefb
add wave -noupdate -radix unsigned /phd_tb/i_tb/fbfreqdivide
add wave -noupdate -divider Internals
add wave -noupdate -format Analog-Step -height 50 -max 300.0 -radix unsigned /phd_tb/i_dut/phasecount
add wave -noupdate -format Analog-Step -height 50 -max 300.0 -radix unsigned -subitemconfig {/phd_tb/i_dut/phasesampled(8) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(7) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(6) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(5) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(4) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(3) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(2) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(1) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(0) {-height 15 -radix unsigned}} /phd_tb/i_dut/phasesampled
add wave -noupdate -radix unsigned -subitemconfig {/phd_tb/i_dut/phasesampled(8) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(7) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(6) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(5) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(4) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(3) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(2) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(1) {-height 15 -radix unsigned} /phd_tb/i_dut/phasesampled(0) {-height 15 -radix unsigned}} /phd_tb/i_dut/phasesampled
add wave -noupdate -divider {Phase difference}
add wave -noupdate -format Analog-Step -height 50 -max 126.99999999999999 -min -127.0 -radix decimal /phd_tb/i_dut/phasediff1
add wave -noupdate -format Analog-Step -height 100 -max 255.0 -min -255.0 -radix decimal /phd_tb/phasediff
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 186
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {105 us}
