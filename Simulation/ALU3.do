onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -format Literal /alu8_tb/i1/opcode
add wave -noupdate -format Literal /alu8_tb/code
add wave -noupdate -format Literal /alu8_tb/i0/lucode
add wave -noupdate -format Literal /alu8_tb/i0/aucode
add wave -noupdate -format Logic /alu8_tb/i0/cinau
add wave -noupdate -format Logic /alu8_tb/i0/selectau
add wave -noupdate -format Logic /alu8_tb/i0/selectsr
add wave -noupdate -divider {binary values}
add wave -noupdate -format Logic /alu8_tb/cin
add wave -noupdate -format Literal /alu8_tb/a
add wave -noupdate -format Literal /alu8_tb/b
add wave -noupdate -format Literal /alu8_tb/y
add wave -noupdate -format Logic /alu8_tb/cout
add wave -noupdate -format Literal /alu8_tb/i0/logiccalc
add wave -noupdate -format Literal /alu8_tb/i0/arithcalc
add wave -noupdate -format Literal /alu8_tb/i0/sr
add wave -noupdate -divider {decimal values}
add wave -noupdate -format Logic /alu8_tb/cin
add wave -noupdate -format Literal -radix decimal /alu8_tb/a
add wave -noupdate -format Literal -radix decimal /alu8_tb/b
add wave -noupdate -format Literal -radix decimal /alu8_tb/y
add wave -noupdate -format Logic /alu8_tb/cout
add wave -noupdate -format Literal -radix decimal /alu8_tb/i0/logiccalc
add wave -noupdate -format Literal -radix decimal /alu8_tb/i0/arithcalc
add wave -noupdate -format Literal -radix decimal /alu8_tb/i0/sr
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
WaveRestoreZoom {0 ps} {840 ns}
