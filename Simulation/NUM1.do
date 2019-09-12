onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider -height 30 Phase
add wave -noupdate -format Analog-Step -height 100 -max 31.0 -radix unsigned /toplevel_tb/i0/phase
add wave -noupdate -divider -height 30 Sinewave
add wave -noupdate -format Analog-Step -height 74 -max 127.0 -min -128.0 -radix decimal /toplevel_tb/i0/sine
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5304000 ps} 0}
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
WaveRestoreZoom {0 ps} {4166900 ps}
