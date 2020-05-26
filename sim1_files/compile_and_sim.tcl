vlog mux2.sv; vlog mux4.sv; vlog alu1bit.sv; vlog alu64bit.sv; vlog alu64bit_test.sv; vlog fas.sv; vlog fas_test.sv;
vsim fas_test;
add wave -position insertpoint sim:/fas_test/*

run -all