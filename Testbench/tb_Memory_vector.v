module Memory_vector_tb;

    // Inputs (declared as reg)
    reg         En;            // Enable input for row decoder
    reg [7:0]   DataIn;        // Input vector elements
    reg [7:0]   RWL;           // Read word line
    reg [7:0]   Col_ADDRS;     // Column decoder input
    reg [7:0]   WWL;           // Write wordline
    reg         READ;          // Read from the memory
    reg         Write;         // Write to the memory
    reg         Clr;           // Clear output cells
    reg [255:0] FromAdder;    // Input from adder (256-bit wide)

    wire [7:0]  DataOut;       // Output vector
    wire [255:0] ToAdder;      // Output to adder (256-bit wide)


    Memory_vector uut (
        .En(En),
        .DataIn(DataIn),
        .RWL(RWL),
        .Col_ADDRS(Col_ADDRS),
        .WWL(WWL),
        .READ(READ),
        .Write(Write),
        .Clr(Clr),
        .DataOut(DataOut),
        .FromAdder(FromAdder),
        .ToAdder(ToAdder)
    );
	 integer i;
	 
	 initial begin
		  En = 0;
        DataIn = 8'b00000000;
        RWL = 8'b00000000;
        Col_ADDRS = 8'b00000000;
        WWL = 8'b00000000;
        READ = 0;
        Write = 0;
        Clr = 0;
        FromAdder = 256'b0;
		  // Apply reset
        #10;
        Clr = 1;
        #10;
        Clr = 0;
		  
		  
		  
		  
//		  for (i =0 ; i <256 ; i = i+1)begin
//			  // Write Operation
//			  En = 1;
//			  DataIn = i;
//			  RWL = 8'b00000000;
//			  Col_ADDRS = i;
//			  WWL = 8'b00000000;
//			  READ = 0;
//			  Write = 1;
//			  Clr = 0;
//			  FromAdder = 256'b0;
//			  #10;
//			  
//			  // Read Operation
//			  En = 1;
//			  DataIn = 0;
//			  RWL = 8'b00000000;
//			  Col_ADDRS = i;
//			  WWL = 8'b00000000;
//			  READ = 1;
//			  Write = 0;
//			  Clr = 0;
//			  FromAdder = 256'b0;
//			  #10;
//			  
//		  end

        #10;
        Clr = 1;
        #10;
        Clr = 0;
		  
		  
		  
	for (i = 0; i<8; i = i+1)begin
			  En = 0;
			  DataIn = 0;
			  RWL = 8'b00000000;
			  Col_ADDRS = 0;
			  WWL = 8'b00000000;
			  WWL[i] = 1'b1;
			  READ = 0;
			  Write = 0;
			  Clr = 0;
			  FromAdder = i*32;
			  #10;
	end		    
		  
	for (i = 0; i<8; i = i+1)begin
			  En = 0;
			  DataIn = 0;
			  RWL = 8'b00000000;
			  RWL[i] = 1'b1;
			  Col_ADDRS = 0;
			  WWL = 8'b00000000;
			  READ = 0;
			  Write = 0;
			  Clr = 0;
			  FromAdder = 0;
			  #10;
	end	  
		  
		  #100 $finish;
		  
	 end
endmodule 