onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Decimal
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle0
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle1
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle2
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle3
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle4
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle5
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle6
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle7
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle8
add wave -noupdate -radix unsigned -radixshowbase 0 /cordicstepangles_tb/stepAngle9
add wave -noupdate -divider Hexadecimal
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle0
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle1
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle2
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle3
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle4
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle5
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle6
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle7
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle8
add wave -noupdate -radix hexadecimal -radixshowbase 0 /cordicstepangles_tb/stepAngle9
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 214
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
WaveRestoreZoom {0 ns} {11 ns}
