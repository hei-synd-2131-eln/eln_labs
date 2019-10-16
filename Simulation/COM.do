onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /serialportreceiver_tb/reset
add wave -noupdate /serialportreceiver_tb/clock
add wave -noupdate -divider {Serial in}
add wave -noupdate -radix hexadecimal /serialportreceiver_tb/progcounter
add wave -noupdate -radix hexadecimal /serialportreceiver_tb/instruction
add wave -noupdate /serialportreceiver_tb/serialout
add wave -noupdate -divider Receiver
add wave -noupdate /serialportreceiver_tb/u_5/restartcounter
add wave -noupdate -format Analog-Step -height 40 -max 40.0 -radix unsigned -subitemconfig {/serialportreceiver_tb/u_5/baudcount(6) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(5) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(4) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(3) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(2) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(1) {-height 15 -radix unsigned} /serialportreceiver_tb/u_5/baudcount(0) {-height 15 -radix unsigned}} /serialportreceiver_tb/u_5/baudcount
add wave -noupdate /serialportreceiver_tb/u_5/shiften
add wave -noupdate -divider Controller
add wave -noupdate /serialportreceiver_tb/u_5/i0/current_state
add wave -noupdate -divider {function output}
add wave -noupdate /serialportreceiver_tb/dataout
add wave -noupdate -radix hexadecimal /serialportreceiver_tb/dataout
add wave -noupdate -radix ascii /serialportreceiver_tb/dataout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1287000 ps} 0}
configure wave -namecolwidth 281
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
WaveRestoreZoom {0 ps} {8400 ns}
