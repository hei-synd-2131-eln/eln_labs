onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider {Phase difference}
add wave -noupdate -format Analog-Step -height 50 -max 255.0 -radix unsigned -subitemconfig {/pha_tb/phasediff(7) {-height 15 -radix unsigned} /pha_tb/phasediff(6) {-height 15 -radix unsigned} /pha_tb/phasediff(5) {-height 15 -radix unsigned} /pha_tb/phasediff(4) {-height 15 -radix unsigned} /pha_tb/phasediff(3) {-height 15 -radix unsigned} /pha_tb/phasediff(2) {-height 15 -radix unsigned} /pha_tb/phasediff(1) {-height 15 -radix unsigned} /pha_tb/phasediff(0) {-height 15 -radix unsigned}} -expand -subitemconfig {/pha_tb/phasediff(7) {-height 15 -radix unsigned} /pha_tb/phasediff(6) {-height 15 -radix unsigned} /pha_tb/phasediff(5) {-height 15 -radix unsigned} /pha_tb/phasediff(4) {-height 15 -radix unsigned} /pha_tb/phasediff(3) {-height 15 -radix unsigned} /pha_tb/phasediff(2) {-height 15 -radix unsigned} /pha_tb/phasediff(1) {-height 15 -radix unsigned} /pha_tb/phasediff(0) {-height 15 -radix unsigned}} /pha_tb/phasediff
add wave -noupdate -divider conditions
add wave -noupdate /pha_tb/i_dut/condition_c
add wave -noupdate /pha_tb/i_dut/condition_b
add wave -noupdate /pha_tb/i_dut/condition_a
add wave -noupdate -divider LEDs
add wave -noupdate -expand /pha_tb/leds
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3070854 ps}
