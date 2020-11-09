onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /phd_tb/reset
add wave -noupdate /phd_tb/clock
add wave -noupdate -divider Phases
add wave -noupdate -radix unsigned -radixshowbase 0 /phd_tb/I_TB/fbFreqDivide
add wave -noupdate /phd_tb/phaseRef
add wave -noupdate /phd_tb/phaseFb
add wave -noupdate -divider Internals
add wave -noupdate -format Analog-Step -height 50 -max 220.00000000000003 -radix unsigned -radixshowbase 0 /phd_tb/I_DUT/refCount
add wave -noupdate -format Analog-Step -height 50 -max 300.0 -radix unsigned -radixshowbase 0 /phd_tb/I_DUT/phaseSampled
add wave -noupdate -radix unsigned -radixshowbase 0 /phd_tb/I_DUT/phaseSampled
add wave -noupdate -divider {Phase difference}
add wave -noupdate -format Analog-Step -height 50 -max 126.99999999999999 -min -127.0 -radix decimal -radixshowbase 0 /phd_tb/I_DUT/phaseDiff1
add wave -noupdate -format Analog-Step -height 100 -max 255.0 -min -255.0 -radix decimal -radixshowbase 0 /phd_tb/phaseDiff
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
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
WaveRestoreZoom {0 ns} {204631 ns}
