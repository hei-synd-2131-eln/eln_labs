onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /nanoprocessor_tb/reset
add wave -noupdate /nanoprocessor_tb/clock
add wave -noupdate -divider Program
add wave -noupdate -radix unsigned /nanoprocessor_tb/progcounter
add wave -noupdate -radix hexadecimal /nanoprocessor_tb/instruction
add wave -noupdate /nanoprocessor_tb/u_0/i1/phase
add wave -noupdate -divider {Data busses}
add wave -noupdate /nanoprocessor_tb/u_0/instrdata
add wave -noupdate -divider {ALU I/O}
add wave -noupdate /nanoprocessor_tb/u_0/alucode
add wave -noupdate /nanoprocessor_tb/u_0/i0/opa
add wave -noupdate /nanoprocessor_tb/u_0/i0/opb
add wave -noupdate /nanoprocessor_tb/u_0/i0/aluout
add wave -noupdate -divider Registers
add wave -noupdate /nanoprocessor_tb/u_0/i0/addra
add wave -noupdate /nanoprocessor_tb/u_0/i0/addrb
add wave -noupdate /nanoprocessor_tb/u_0/i0/regwrite
add wave -noupdate /nanoprocessor_tb/u_0/i0/u_1/registerarray(0)
add wave -noupdate /nanoprocessor_tb/u_0/i0/u_1/registerarray(1)
add wave -noupdate /nanoprocessor_tb/u_0/i0/u_1/registerarray(2)
add wave -noupdate /nanoprocessor_tb/u_0/i0/u_1/registerarray(3)
add wave -noupdate -divider {Port I/O}
add wave -noupdate /nanoprocessor_tb/portin
add wave -noupdate /nanoprocessor_tb/portout
add wave -noupdate /nanoprocessor_tb/writestrobe
add wave -noupdate -divider {function output}
add wave -noupdate /nanoprocessor_tb/serialout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 281
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {2100 ns}
