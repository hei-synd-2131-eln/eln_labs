onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -expand -group {Reset and clock} /pwm_tb/reset
add wave -noupdate -expand -group {Reset and clock} /pwm_tb/clock
add wave -noupdate -divider {Input amplitude}
add wave -noupdate -format Analog-Step -height 50 -max 1023.0 -radix unsigned /pwm_tb/parallelIn
add wave -noupdate -divider {Output PWM}
add wave -noupdate -expand -group PWM /pwm_tb/pwm1
add wave -noupdate -expand -group PWM /pwm_tb/pwm1_n
add wave -noupdate -expand -group PWM /pwm_tb/pwm2
add wave -noupdate -expand -group PWM /pwm_tb/pwm2_n
add wave -noupdate -divider {Load Voltage and Current}
add wave -noupdate -format Analog-Step -height 50 -max 12.0 -min -12.0 /pwm_tb/amplitude
add wave -noupdate -format Analog-Step -height 50 -max 12.0 -min -12.0 /pwm_tb/meanAmplitude
add wave -noupdate -format Analog-Step -height 50 -max 2.3999999999999999 -min -2.3999999999999999 /pwm_tb/current
add wave -noupdate -format Analog-Step -height 50 -max 2.3999999999999999 -min -2.3999999999999999 /pwm_tb/meanCurrent
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {2100 us}
