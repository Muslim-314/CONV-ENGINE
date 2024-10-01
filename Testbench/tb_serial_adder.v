module tb_serial_adder;

    // Inputs
    reg clk;
    reg reset;
	 reg a,b;
    reg cin;         // Initial carry input (for the first bit)

    // Outputs
    wire s;
    wire cout;

    // Internal signals
    reg [7:0] sum,num1,num2;
    integer i;  // Loop variable

    // Instantiate the Unit Under Test (UUT)
    serial_adder uut (
        .clk(clk),
        .reset(reset),
        .a(a),    // Bitwise inputs
        .b(b),    // Bitwise inputs
        .cin(cin),   // Initial carry input
        .s(s),
        .cout(cout)
    );

    // Clock generation (period = 10 time units)
    

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        num1 = 8'b00101101;  // 45 in binary
        num2 = 8'b01111010;  // 122 in binary
        cin = 0;          // No carry input initially
        sum = 0;
		  #10;
		  
		  for(i = 0; i<8 ; i = i+1)begin
				a = num1[i];
				b = num2[i];
				clk = 1'b1;
				#10;
				clk = 1'b0;
				#10;
		  end
		  
			
	

	$finish;  // End simulation
    end
endmodule
