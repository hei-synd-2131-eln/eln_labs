onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider -height 30 {binary values}
add wave -noupdate -radixshowbase 0 /add4_tb/cin
add wave -noupdate -radix binary -radixshowbase 0 /add4_tb/a
add wave -noupdate -radix binary -radixshowbase 0 /add4_tb/b
add wave -noupdate -radix binary -radixshowbase 0 /add4_tb/s
add wave -noupdate -radixshowbase 0 /add4_tb/cout
add wave -noupdate -divider -height 30 {unsigned values}
add wave -noupdate -radixshowbase 0 /add4_tb/cin
add wave -noupdate -radix unsigned -radixshowbase 0 /add4_tb/a
add wave -noupdate -radix unsigned -radixshowbase 0 /add4_tb/b
add wave -noupdate -radix unsigned -radixshowbase 0 /add4_tb/s
add wave -noupdate -radixshowbase 0 /add4_tb/cout
add wave -noupdate -divider -height 30 {signed values}
add wave -noupdate -radixshowbase 0 /add4_tb/cin
add wave -noupdate -radix decimal -radixshowbase 0 /add4_tb/a
add wave -noupdate -radix decimal -radixshowbase 0 /add4_tb/b
add wave -noupdate -radix decimal -radixshowbase 0 /add4_tb/s
add wave -noupdate -radixshowbase 0 /add4_tb/cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {105 ns}
