onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider Angle
add wave -noupdate -format Analog-Step -height 50 -max 255.0 -radix unsigned -subitemconfig {/cordic_tb/phase(7) {-height 15 -radix unsigned} /cordic_tb/phase(6) {-height 15 -radix unsigned} /cordic_tb/phase(5) {-height 15 -radix unsigned} /cordic_tb/phase(4) {-height 15 -radix unsigned} /cordic_tb/phase(3) {-height 15 -radix unsigned} /cordic_tb/phase(2) {-height 15 -radix unsigned} /cordic_tb/phase(1) {-height 15 -radix unsigned} /cordic_tb/phase(0) {-height 15 -radix unsigned}} /cordic_tb/phase
add wave -noupdate -divider Internals
add wave -noupdate -format Analog-Step -height 20 -max 63.0 -min -63.0 -radix decimal /cordic_tb/i_dut/phase0
add wave -noupdate -divider {Sine and cosine}
add wave -noupdate -format Analog-Step -height 100 -max 500.0 -min -500.0 -radix decimal /cordic_tb/sine
add wave -noupdate -format Analog-Step -height 100 -max 500.0 -min -500.0 -radix decimal /cordic_tb/cosine
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
WaveRestoreZoom {0 ps} {10500 ns}
