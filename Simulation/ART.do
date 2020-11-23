onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /serialport_tb/reset
add wave -noupdate /serialport_tb/clock
add wave -noupdate -divider {Parallel in}
add wave -noupdate /serialport_tb/send
add wave -noupdate -radix hexadecimal -radixshowbase 0 /serialport_tb/dataToSend
add wave -noupdate -radix ascii -radixshowbase 0 /serialport_tb/dataToSend
add wave -noupdate -divider {Serial signal}
add wave -noupdate /serialport_tb/serialData
add wave -noupdate -divider {Parallel out}
add wave -noupdate /serialport_tb/received
add wave -noupdate -radix hexadecimal -radixshowbase 0 /serialport_tb/receivedData
add wave -noupdate -radix ascii -radixshowbase 0 /serialport_tb/receivedData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9401 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ns} {3150 ns}
