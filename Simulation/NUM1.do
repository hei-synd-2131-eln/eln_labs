onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider -height 30 Phase
add wave -noupdate -format Analog-Step -height 100 -max 31.0 -radix unsigned -radixshowbase 0 /sinewave_tb/I_DUT/phase
add wave -noupdate -divider -height 30 Sinewave
add wave -noupdate -format Analog-Step -height 200 -max 127.0 -min -128.0 -radix decimal -radixshowbase 0 /sinewave_tb/I_DUT/sine
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 63
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
WaveRestoreZoom {0 ns} {1059 ns}
