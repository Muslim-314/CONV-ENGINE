onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[0]/memory_arr/stored_value}
add wave -noupdate {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[1]/memory_arr/stored_value}
add wave -noupdate {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[2]/memory_arr/stored_value}
add wave -noupdate {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[3]/memory_arr/stored_value}
add wave -noupdate -expand -group vectorA1 {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[4]/memory_arr/ToAdder}
add wave -noupdate -expand -group vectorA1 {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[3]/memory_arr/ToAdder}
add wave -noupdate -expand -group vectorA1 {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[2]/memory_arr/ToAdder}
add wave -noupdate -expand -group vectorA1 {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[1]/memory_arr/ToAdder}
add wave -noupdate -expand -group vectorA1 {/memory_32_by_256_tb/uut/VectorA/Mmeory_vector[0]/memory_arr/ToAdder}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 469
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {362 ps}
