module memory_32_by_256_tb;
  // Inputs
  reg clk;
  reg En;
  reg [2:0] Row_ADDRS;
  reg [7:0] DataIn;
  reg [7:0] Col_ADDRS;
  reg READ;
  reg Write;

  // Outputs
  wire [7:0] DataOut;
  wire DONE;
  
  
    // Instantiate the Unit Under Test (UUT)
  memory_32_by_256 uut (
    .clk(clk), 
    .En(En), 
    .Row_ADDRS(Row_ADDRS), 
    .DataIn(DataIn), 
    .Col_ADDRS(Col_ADDRS), 
    .READ(READ), 
    .Write(Write), 
    .DataOut(DataOut), 
    .DONE(DONE)
  );
	integer i;
	integer n = 5;
	
 always #5 clk = ~clk;

  
  initial begin
	
	clk = 1'b0;
	En = 1'b0;
	Row_ADDRS = 3'b000;
	Col_ADDRS = 8'h00;
	DataIn    = 8'h00;
	READ      = 1'b0;
	Write     = 1'b0;
	#10;
	
	
	//load vector 1
	for (i = 0;i< n ;i = i+1)begin
		Row_ADDRS = 3'b000;
		Col_ADDRS = i;
		DataIn    = i;
		#5
		Write     = 1'b1;
		#5;
		Write = 1'b0;
		#5;
	end
	#100;
	
	
	
	//load vector 1
	for (i = 0;i< n ;i = i+1)begin
		Row_ADDRS = 3'b001;
		Col_ADDRS = i;
		DataIn    = i;
		#5
		Write     = 1'b1;
		#5;
		Write = 1'b0;
		#5;
	end
	#100;
  
  En =1'b1;
  wait(DONE);
  En =1'b0;
  #100;
  
  for (i = 0; i < n; i = i+1)begin
		Row_ADDRS = 3'b010;
		Col_ADDRS = i;
		DataIn    = 0;
		READ      = 1'b1;
		#5;
		READ = 1'b0;
		#5;
	end
  #100;
   $finish;
  end
  
  
endmodule 