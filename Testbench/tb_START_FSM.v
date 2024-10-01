module tb_START_FSM;


  reg clk;
  reg En;


  wire CLR;
  wire start;
  START_FSM uut (
    .clk(clk),
    .En(En),
    .CLR(CLR),
    .start(start)
  );

 
  always #5 clk = ~clk;

  
  initial begin
    clk = 0;
    En = 0;
    #10;
    En = 1; 
    #100;
	 En = 0;
	 #10
	 En = 1;
	 #500
    $finish;
  end

  // Monitor output signals
  initial begin
    $monitor("Time: %0d | clk: %b | En: %b | CLR: %b | start: %b", $time, clk, En, CLR, start);
  end

endmodule
