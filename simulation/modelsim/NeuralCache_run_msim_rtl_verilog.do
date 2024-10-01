transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/Memory_array.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/Memory_vector.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/decoder_8_to_256.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/memory_32_by_256.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/full_adder.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/decoder_3to8.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/START_FSM.v}
vlog -vlog01compat -work work +incdir+/home/muslim/HDD/NeuralCache {/home/muslim/HDD/NeuralCache/ADD_FSM.v}

