onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /mib_tb/reset
add wave -noupdate /mib_tb/clock
add wave -noupdate /mib_tb/alucode
add wave -noupdate /mib_tb/i1/instruction
add wave -noupdate -divider {ALU & regs control}
add wave -noupdate /mib_tb/addressa
add wave -noupdate /mib_tb/addressb
add wave -noupdate /mib_tb/instrdata
add wave -noupdate /mib_tb/portinoe
add wave -noupdate /mib_tb/instrdataoe
add wave -noupdate /mib_tb/registerfileoe
add wave -noupdate /mib_tb/writeenable
add wave -noupdate -divider {ALU I/O}
add wave -noupdate /mib_tb/carryin
add wave -noupdate /mib_tb/i0/busa
add wave -noupdate /mib_tb/i0/busb
add wave -noupdate /mib_tb/i0/y
add wave -noupdate /mib_tb/i0/cout
add wave -noupdate -divider Registers
add wave -noupdate /mib_tb/i0/register0
add wave -noupdate /mib_tb/i0/register1
add wave -noupdate /mib_tb/i0/register2
add wave -noupdate /mib_tb/i0/register3
add wave -noupdate -divider {Port out}
add wave -noupdate /mib_tb/portout
add wave -noupdate /mib_tb/writestrobe
add wave -noupdate -radix binary /mib_tb/ioout
add wave -noupdate -divider {function output}
add wave -noupdate /mib_tb/serialout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 161
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {630 ns}
