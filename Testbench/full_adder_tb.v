module full_adder_tb;
    
    // Inputs
    reg [7:0] num1 = 8'b10101010; 
    reg [7:0] num2 = 8'b10101010; 
    reg a, b;
    reg C_EN;
    reg rst;
    integer i;
    // Outputs
    wire sum;
    reg [7:0] sum_reg;
    
    full_adder uut (
        .a(a),      
        .b(b),     
        .C_EN(C_EN),
        .rst(rst),
        .s(sum)
    );
	 
    initial begin
        C_EN = 0;
        rst = 1;   
		  sum_reg = 8'b00;	  
        #50;               
        rst = 1'b0;      
		for(i = 0; i<8; i = i +1)begin
			  a = num1[i];
			  b = num2[i];
			  C_EN = 1'b0;       
			  #50;
			  sum_reg[i] = sum;  
			  C_EN = 1'b1;       
			  #50;               
       end
        $finish;  
    end
    
endmodule
