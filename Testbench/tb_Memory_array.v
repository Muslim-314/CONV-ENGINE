module Memory_array_tb;

	// Inputs (declared as reg)
	reg [7:0] DataIn;    // Input vector elements
	reg [7:0] RWL;       // Read word line
	reg       GWL;       // Global wordline input
	reg [7:0] WWL;       // Write wordline
	reg       READ;      // Read from the memory
	reg       Write;     // Write to the memory
	reg       Clr;       // Clear output cells
	reg       FromAdder; // Input from the adder

	wire [7:0] DataOut;  // Output vector
	wire       ToAdder;  // Output to adder
	
	
	
	reg [7:0] FromAdder_reg, ToAdder_reg;
	
	// Instantiate the Memory_array module
	Memory_array uut (
		.DataIn(DataIn),
		.RWL(RWL),
		.GWL(GWL),
		.WWL(WWL),
		.READ(READ),
		.Write(Write),
		.Clr(Clr),
		.DataOut(DataOut),
		.FromAdder(FromAdder),
		.ToAdder(ToAdder)
	);
integer i;
integer j;
	// Testbench logic
	initial begin
		// Initialize inputs
		DataIn    = 8'b00000000;
		RWL       = 8'b00000000;
		GWL       = 0;
		WWL       = 8'b00000000;
		READ      = 0;
		Write     = 0;
		Clr       = 0;
		FromAdder = 0;
		
		#10;

		DataIn    = 8'b11111111;
		RWL       = 8'b00000000;
		GWL       = 1;
		WWL       = 8'b00000000;
		READ      = 0;
		Write     = 1;
		Clr       = 0;
		FromAdder = 0;
		
		#10;
		
		
		DataIn    = 8'b00000000;
		RWL       = 8'b00000000;
		GWL       = 1;
		WWL       = 8'b00000000;
		READ      = 1;
		Write     = 0;
		Clr       = 0;
		FromAdder = 0;
		
		#10;
		
		
		
		DataIn    = 8'b11111111;
		RWL       = 8'b00000000;
		GWL       = 1;
		WWL       = 8'b00000000;
		READ      = 1;
		Write     = 0;
		Clr       = 0;
		FromAdder = 0;
		
		#10;
		
		DataIn    = 8'b00000000;
		RWL       = 8'b00000000;
		GWL       = 0;
		WWL       = 8'b00000000;
		READ      = 0;
		Write     = 0;
		Clr       = 1;
		FromAdder = 0;
		
		#10;
		
		FromAdder_reg = 8'b01010101;
		for (i =0 ; i<8; i = i +1)begin
			DataIn    = 8'b00000000;
			RWL       = 8'b00000000;
			GWL       = 0;
			WWL       = 8'b00000000;
			WWL[i]    = 1'b1;
			READ      = 0;
			Write     = 0;
			Clr       = 0;
			FromAdder = FromAdder_reg[i];
			#10;
		end
		WWL = 8'h00; #10;
		
		
for (j = 0; j < 8; j = j + 1) begin
    DataIn    = 8'b00000000;
    RWL       = 8'b00000000;
    RWL[j]    = 1'b1;		
    GWL       = 0;
    WWL       = 8'b00000000;
    READ      = 0;
    Write     = 0;
    Clr       = 0;
    FromAdder = 0;

    #5; // Add a small delay to allow ToAdder to stabilize
    ToAdder_reg[j] = ToAdder;  // Capture the value after delay
    #5; // Additional delay if needed
end

		#100 $finish;
	end


endmodule
