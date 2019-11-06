onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -format Analog-Step -height 30 -max 128.0 -min -128.0 -radix decimal -radixshowbase 0 /cordicaddsub_tb/phaseIn
add wave -noupdate -format Analog-Step -height 30 -max 128.0 -min -128.0 -radix decimal -radixshowbase 0 /cordicaddsub_tb/stepAngle
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/xIn
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/xInShifted
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yIn
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yInShifted
add wave -noupdate -divider Outputs
add wave -noupdate -format Analog-Step -height 30 -max 127.0 -min -128.0 -radix decimal -radixshowbase 0 /cordicaddsub_tb/phaseOut
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/xOut
add wave -noupdate -format Analog-Step -height 30 -max 511.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 220
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
WaveRestoreZoom {0 ns} {6310500 ns}
