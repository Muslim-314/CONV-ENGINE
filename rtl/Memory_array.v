///*
//	Contains 8 bit storage element with parallel and serial ports
//	To Load parallel data into the block energize the DataIn with 
//	8 bits and GWL & Write signal to go High. For the read operation
//	READ and GWL goes high output can be read from the DataOut port.
//	For serial input write the bit to the FromAdder and RWL[x] signal
//	will write the value at FromAdder to location x in the memory.
//*/
//module Memory_array(
//	input [7:0]   DataIn, // Input vector elements
//	input [7:0]   RWL,    // Read word line
//	input 		  GWL,    // Column Decoder input
//	input [7:0]   WWL,    // Write wordline
//	input         READ,   // Read from the memory
//	input         Write,  // Write to the memory 
//	input			  Clr,    // Clear output cells
//	output [7:0]  DataOut,// output port
//	input  		  FromAdder,
//	output        ToAdder
//);
//
//	genvar i;
//	generate
//		for (i = 0; i<8 ; i = i+1) begin: array
//				stdCell Standard_Cell(
//					 .RWL(RWL[i]),         
//					 .WWL(WWL[i]),         
//					 .GWL(GWL),         
//					 .CLR(Clr),        
//					 .READ(READ),       
//					 .Write(Write),     
//					 .FromAdder(FromAdder),  
//					 .BL(DataIn[i]),           
//					 .SA(DataOut[i]),           
//					 .ToAdder(ToAdder) 
//				);
//		end
//	endgenerate	
//endmodule 



module Memory_array(
    input  [7:0]   DataIn,   // Input vector elements
    input  [7:0]   RWL,      // Read word line
    input          GWL,      // Column Decoder input
    input  [7:0]   WWL,      // Write word line
    input          READ,     // Read from memory
    input          Write,    // Write to memory
    input          Clr,      // Clear output cells
    output reg [7:0] DataOut, // Output port
    input          FromAdder, // Data from adder
    output reg     ToAdder    // Data to adder
);

    reg [7:0] stored_value;
	 integer j;
	  integer i;
    always @(*) begin
        //clr operation
        if (Clr) begin
            stored_value = 8'b0;
        end else begin
         //write operation
            if (GWL & Write) begin
                stored_value = DataIn;
            end else begin
                for (i = 0; i < 8; i = i + 1) begin
                    if (WWL[i]) begin
                        stored_value[i] = FromAdder; 
                    end
                end
            end
        end
        ToAdder = 1'bz;  
		  //read operation
        for (j = 0; j < 8; j = j + 1) begin
            if (RWL[j]) begin
                ToAdder = stored_value[j]; 
            end
        end
        if (GWL & READ) begin
            DataOut = stored_value;
        end else begin
            DataOut = 8'bz;  
        end
    end
endmodule


