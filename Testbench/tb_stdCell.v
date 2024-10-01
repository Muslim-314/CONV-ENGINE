module tb_stdCell;

  // Inputs
  reg RWL;
  reg WWL;
  reg GWL;
  reg CLR;
  reg READ;
  reg Write;
  reg FromAdder;
  reg BL;

  // Outputs
  wire SA;
  wire ToAdder;

  // Instantiate the Unit Under Test (UUT)
  stdCell uut (
    .RWL(RWL), 
    .WWL(WWL), 
    .GWL(GWL), 
    .CLR(CLR),
    .READ(READ), 
    .Write(Write), 
    .FromAdder(FromAdder), 
    .BL(BL), 
    .SA(SA), 
    .ToAdder(ToAdder)
  );

  initial begin
    // Initialize Inputs
    RWL = 0;
    WWL = 0;
    GWL = 0;
    CLR = 0;
    READ = 0;
    Write = 0;
    FromAdder = 0;
    BL = 0;

    // Display the results
    $monitor("Time=%0t | RWL=%b, WWL=%b, GWL=%b, CLR=%b, READ=%b, Write=%b, FromAdder=%b, BL=%b, SA=%b, ToAdder=%b", 
              $time, RWL, WWL, GWL, CLR, READ, Write, FromAdder, BL, SA, ToAdder);

    // Wait for global reset
    #10;

    // Test Case 1: Write from Adder
    WWL = 1; 
    FromAdder = 1; 
    #10;
    WWL = 0;
    FromAdder = 0;
    #10;

    // Test Case 2: Write from Bitline
    GWL = 1; 
    Write = 1; 
    BL = 1; 
    #10;
    Write = 0;
    BL = 0;
    GWL = 0;
    #10;

    // Test Case 3: Read to ToAdder
    RWL = 1; 
    #10;
    RWL = 0;
    #10;

    // Test Case 4: Read to Sense Amplifier
    GWL = 1; 
    READ = 1; 
    #10;
    READ = 0;
    GWL = 0;
    #10;

    // Test Case 5: Clear stored value
    CLR = 1;
    #10;
    CLR = 0;
    #10;

    // Test Case 6: Verify clearing worked, try to read again
    RWL = 1;
    #10;
    RWL = 0;
    #10;

    // End simulation
    $finish;
  end

endmodule
