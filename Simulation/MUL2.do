onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider -height 30 {binary numbers}
add wave -noupdate -label A -radixshowbase 0 /mul4signed_tb/a
add wave -noupdate -label B -radixshowbase 0 /mul4signed_tb/b
add wave -noupdate -label product -radixshowbase 0 /mul4signed_tb/p
add wave -noupdate -divider -height 30 {unsigned numbers}
add wave -noupdate -label A -radix decimal -radixshowbase 0 /mul4signed_tb/a
add wave -noupdate -label B -radix decimal -radixshowbase 0 /mul4signed_tb/b
add wave -noupdate -label product -radix decimal -radixshowbase 0 /mul4signed_tb/p
add wave -noupdate -divider -height 30 {analog traces}
add wave -noupdate -format Analog-Step -height 30 -label A -max 18.0 -min -8.0 -radix decimal -radixshowbase 0 /mul4signed_tb/a
add wave -noupdate -format Analog-Step -height 30 -label B -max 18.0 -min -8.0 -radix decimal -radixshowbase 0 /mul4signed_tb/b
add wave -noupdate -format Analog-Step -height 200 -label product -max 128.0 -min -128.0 -radix decimal -radixshowbase 0 /mul4signed_tb/p
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15303 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {27300 ns}
