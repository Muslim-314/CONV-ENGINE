module Memory_vector(
	input         En,        //Row decoder input
	input [7:0]   DataIn,    // Input vector elements
	input [7:0]   RWL,       // Read word line
	input [7:0]   Col_ADDRS, // Column Decoder input
	input [7:0]   WWL,       // Write wordline
	input         READ,      // Read from the memory
	input         Write,     // Write to the memory 
	input			  Clr,       // Clear output cells
	output [7:0]  DataOut,   // output port
	input  [255:0]FromAdder,
	output [255:0]ToAdder
);




wire [255:0]GWL;

decoder_8_to_256   dec8to256(
     .in(Col_ADDRS),       
     .enable(READ | Write),    
     .out(GWL) 
);

	genvar i; 
	generate 
		for(i = 0 ; i<256; i = i+1)begin: Mmeory_vector
			Memory_array memory_arr (
			  .DataIn(DataIn),    
			  .RWL(RWL),          
			  .GWL(GWL[i] & En),           
			  .WWL(WWL),           
			  .READ(READ),         
			  .Write(Write),       
			  .Clr(Clr),           
			  .DataOut(DataOut),   
			  .FromAdder(FromAdder[i]),
			  .ToAdder(ToAdder[i])    
		 );
			
		end
		
	endgenerate
	
endmodule 