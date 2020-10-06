onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sub8_tb/cin
add wave -noupdate -format Analog-Step -height 50 -max 14.999999999999998 -radix decimal -radixshowbase 0 /sub8_tb/a
add wave -noupdate -format Analog-Step -height 50 -max 14.999999999999998 -radix decimal -radixshowbase 0 /sub8_tb/b
add wave -noupdate -format Analog-Step -height 100 -max 15.0 -min -15.0 -radix decimal -radixshowbase 0 /sub8_tb/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {473 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 48
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {8400 ns}
