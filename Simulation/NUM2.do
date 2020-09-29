onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 50 {Group: XXX}
add wave -noupdate -format Analog-Step -height 50 -label sine -max 130.0 -min -130.0 -radix decimal -radixshowbase 0 /sinewave_tb/I_DUT/sine
add wave -noupdate -divider {Operation results}
add wave -noupdate -format Analog-Step -height 50 -label {sine inverted} -max 130.0 -min -130.0 -radix decimal -radixshowbase 0 /sinewave_tb/sineInverted
add wave -noupdate -format Analog-Step -height 50 -label {sine added} -max 130.0 -min -130.0 -radix decimal -radixshowbase 0 /sinewave_tb/sineAdded
add wave -noupdate -format Analog-Step -height 200 -label {sine multiplied} -max 33000.0 -min -33000.0 -radix decimal -radixshowbase 0 /sinewave_tb/sineMultiplied
add wave -noupdate -format Analog-Step -height 200 -label {sine concatenated} -max 33000.0 -min -33000.0 -radix decimal -radixshowbase 0 /sinewave_tb/sineConcatenated
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 109
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
WaveRestoreZoom {0 ns} {1050 ns}
