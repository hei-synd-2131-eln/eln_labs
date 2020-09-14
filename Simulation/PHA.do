onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider {Phase difference}
add wave -noupdate -format Analog-Step -height 100 -max 255.0 -radix unsigned -childformat {{/pha_tb/phaseDiff(7) -radix unsigned} {/pha_tb/phaseDiff(6) -radix unsigned} {/pha_tb/phaseDiff(5) -radix unsigned} {/pha_tb/phaseDiff(4) -radix unsigned} {/pha_tb/phaseDiff(3) -radix unsigned} {/pha_tb/phaseDiff(2) -radix unsigned} {/pha_tb/phaseDiff(1) -radix unsigned} {/pha_tb/phaseDiff(0) -radix unsigned}} -radixshowbase 0 -expand -subitemconfig {/pha_tb/phaseDiff(7) {-radix unsigned} /pha_tb/phaseDiff(6) {-radix unsigned} /pha_tb/phaseDiff(5) {-radix unsigned} /pha_tb/phaseDiff(4) {-radix unsigned} /pha_tb/phaseDiff(3) {-radix unsigned} /pha_tb/phaseDiff(2) {-radix unsigned} /pha_tb/phaseDiff(1) {-radix unsigned} /pha_tb/phaseDiff(0) {-radix unsigned}} /pha_tb/phaseDiff
add wave -noupdate -divider conditions
add wave -noupdate /pha_tb/I_DUT/condition_c
add wave -noupdate /pha_tb/I_DUT/condition_b
add wave -noupdate /pha_tb/I_DUT/condition_a
add wave -noupdate -divider LEDs
add wave -noupdate -radix binary -radixshowbase 0 -expand /pha_tb/leds
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
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
WaveRestoreZoom {0 ns} {3070 ns}
