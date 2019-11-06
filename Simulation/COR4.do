onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -format Analog-Step -height 50 -max 3.0 -radix unsigned -radixshowbase 0 /cordicquadrants_tb/phaseHigh
add wave -noupdate -format Analog-Step -height 50 -max 127.0 -radix unsigned -radixshowbase 0 /cordicquadrants_tb/x
add wave -noupdate -format Analog-Step -height 50 -max 127.0 -radix unsigned -radixshowbase 0 /cordicquadrants_tb/y
add wave -noupdate -divider Outputs
add wave -noupdate -format Analog-Step -height 50 -max 127.0 -min -127.0 -radix decimal -radixshowbase 0 /cordicquadrants_tb/cosine
add wave -noupdate -format Analog-Step -height 50 -max 127.0 -min -127.0 -radix decimal -radixshowbase 0 /cordicquadrants_tb/sine
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 188
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {105 ns}
