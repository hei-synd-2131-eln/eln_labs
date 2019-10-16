onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider -height 30 {binary numbers}
add wave -noupdate -format Literal -height 15 -label A /mul4signed_tb/a
add wave -noupdate -format Literal -height 15 -label B /mul4signed_tb/b
add wave -noupdate -format Literal -height 15 -label product /mul4signed_tb/p
add wave -noupdate -divider -height 30 {unsigned numbers}
add wave -noupdate -format Literal -height 15 -label A -radix decimal /mul4signed_tb/a
add wave -noupdate -format Literal -height 15 -label B -radix decimal /mul4signed_tb/b
add wave -noupdate -format Literal -height 15 -label product -radix decimal /mul4signed_tb/p
add wave -noupdate -divider -height 30 {analog traces}
add wave -noupdate -format Analog-Step -height 30 -label A -max 18.0 -min -8.0 -radix decimal /mul4signed_tb/a
add wave -noupdate -format Analog-Step -height 30 -label B -max 18.0 -min -8.0 -radix decimal /mul4signed_tb/b
add wave -noupdate -format Analog-Step -height 200 -label product -max 128.0 -min -128.0 -radix decimal /mul4signed_tb/p
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {15303 ns}
WaveRestoreZoom {0 ns} {27300 ns}
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
WaveRestoreZoom {0 ps} {27300 ns}
