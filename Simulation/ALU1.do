onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -format Literal /lu8_tb/i1/opcode
add wave -noupdate -format Literal /lu8_tb/code
add wave -noupdate -format Literal /lu8_tb/a
add wave -noupdate -format Literal /lu8_tb/b
add wave -noupdate -format Literal /lu8_tb/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {359 ns}
WaveRestoreZoom {0 ns} {100 ns}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {63 ns}
run 100 us
