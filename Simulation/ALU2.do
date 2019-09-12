onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -format Literal /au8_tb/i0/opcode
add wave -noupdate -format Literal /au8_tb/code
add wave -noupdate -divider {binary values}
add wave -noupdate -format Logic /au8_tb/cin
add wave -noupdate -format Literal /au8_tb/a
add wave -noupdate -format Literal /au8_tb/b
add wave -noupdate -format Literal /au8_tb/y
add wave -noupdate -format Logic /au8_tb/cout
add wave -noupdate -divider {unsigned values}
add wave -noupdate -format Logic /au8_tb/cin
add wave -noupdate -format Literal -radix unsigned /au8_tb/a
add wave -noupdate -format Literal -radix unsigned /au8_tb/b
add wave -noupdate -format Literal -radix unsigned /au8_tb/y
add wave -noupdate -format Logic /au8_tb/cout
add wave -noupdate -divider {signed values}
add wave -noupdate -format Logic /au8_tb/cin
add wave -noupdate -format Literal -radix decimal /au8_tb/a
add wave -noupdate -format Literal -radix decimal /au8_tb/b
add wave -noupdate -format Literal -radix decimal /au8_tb/y
add wave -noupdate -format Logic /au8_tb/cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {105 ns}
