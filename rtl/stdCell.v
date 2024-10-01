module stdCell(
	input RWL,                  // read wordline
	input WWL,                  // Write wordline
	input GWL,                  // Global wordline
	input CLR,	            	 // Clear
	input READ,                 // Read, Stored value goes to SE
	input Write,                // Write, value at BL gets stored
	input FromAdder,            // output from the adder
	input BL,       // Bitline
	output reg SA,      // Sense Amplifier
	output reg ToAdder  // Stored value become input to the adder
);
	reg stored_value;
	always@(*)begin
		//writing to the cell
		     if(WWL) stored_value = FromAdder;
		else if(GWL & Write) stored_value = BL;
		else if(CLR) stored_value = 1'b0;     
		//reading from the cell
		if(RWL)  ToAdder = stored_value;
		else     ToAdder = 1'bz;
		if(GWL & READ) SA = stored_value;
		else SA = 1'bz;
	end

endmodule 