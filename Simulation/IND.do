onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {ElN - IND}
add wave -noupdate -divider {Group: XXX}
add wave -noupdate /ind_tb/unmarried
add wave -noupdate /ind_tb/man
add wave -noupdate /ind_tb/swiss
add wave -noupdate /ind_tb/moreThan25
add wave -noupdate -divider Conditions
add wave -noupdate /ind_tb/I_DUT/conditionA
add wave -noupdate /ind_tb/I_DUT/conditionB
add wave -noupdate /ind_tb/I_DUT/conditionC
add wave -noupdate /ind_tb/I_DUT/conditionD
add wave -noupdate /ind_tb/I_DUT/conditionE
add wave -noupdate -divider Output
add wave -noupdate /ind_tb/accept
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9281100 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 181
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {160180 ps}
