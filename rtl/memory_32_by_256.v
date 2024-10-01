module memory_32_by_256(
	input 		  clk,       // clock signal
	input         En,        // Adder opcode
	input [2:0]   Row_ADDRS, // Row decoder input
	input [7:0]   DataIn,    // Input vector elements
	input [7:0]   Col_ADDRS, // Column Decoder input
	input         READ,      // Read from the memory
	input         Write,     // Write Enable
	output [7:0]  DataOut,   // output port
	output 		  DONE
);


	wire [7:0]RWLv1,RWLv2,WWLp;
	wire C_EN, CLR;
	wire [15:0]WWL;
	wire [7:0]Row_Dec_Out;
	wire [255:0]ToAdderv1,FromAdder;
	wire [255:0]ToAdderv2;



	decoder_3to8 decoder_inst (
		 .in(Row_ADDRS), 
		 .en(READ | Write), 
		 .out(Row_Dec_Out)
	);

	ADD_FSM add_fsm_inst (
		.clk(clk), 
		.En(En), 
		.RWLv1(RWLv1), 
		.RWLv2(RWLv2), 
		.WWLp(WWLp), 
		.C_EN(C_EN), 
		.CLR(CLR), 
		.DONE(DONE)
	);



// vector A 
	Memory_vector VectorA (
		.En(Row_Dec_Out[0]), 
		.DataIn(DataIn), 
		.RWL(RWLv1), 
		.Col_ADDRS(Col_ADDRS), 
		.WWL(8'd0), 
		.READ(READ), 
		.Write(Write), 
		.Clr(1'b0), 
		.DataOut(DataOut), 
		.FromAdder(), 
		.ToAdder(ToAdderv1)
	);

// vector B 
	Memory_vector VectorB (
		.En(Row_Dec_Out[1]), 
		.DataIn(DataIn), 
		.RWL(RWLv2), 
		.Col_ADDRS(Col_ADDRS), 
		.WWL(8'd0), 
		.READ(READ), 
		.Write(Write), 
		.Clr(1'b0), 
		.DataOut(DataOut), 
		.FromAdder(), 
		.ToAdder(ToAdderv2)
	);
	
	
	//Multiplication results reqire 16 bit for we need 2 vector to store the result
		Memory_vector productVector1 (
		.En(Row_Dec_Out[2]), 
		.DataIn(DataIn), 
		.RWL(8'h00), 
		.Col_ADDRS(Col_ADDRS), 
		.WWL(WWLp), 
		.READ(READ), 
		.Write(Write), 
		.Clr(CLR), 
		.DataOut(DataOut),
		.FromAdder(FromAdder), 
		.ToAdder()
	);
	
		Memory_vector productVector2 (
		.En(Row_Dec_Out[3]), 
		.DataIn(DataIn), 
		.RWL(8'h00), 
		.Col_ADDRS(Col_ADDRS), 
		.WWL(8'h00), 
		.READ(READ), 
		.Write(Write), 
		.Clr(CLR), 
		.DataOut(DataOut),
		.FromAdder(FromAdder), 
		.ToAdder()
	);
	genvar i;
	generate 
		for (i = 0 ; i < 256 ; i = i +1)begin : gaint_adder
		 full_adder gfa(
		 .a(ToAdderv1[i]), .b(ToAdderv2[i]), 
		 .C_EN(C_EN), .rst(CLR),
		 .s(FromAdder[i]));
		end
	endgenerate
endmodule 