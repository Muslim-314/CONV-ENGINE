module tb_adder_256;

    reg [3:0] a;
    reg [3:0] b;
    reg C_EN;
    reg rst;

    wire [3:0] sum;

    adder_256 uut (
        .a(a), 
        .b(b), 
        .C_EN(C_EN), 
        .rst(rst), 
        .sum(sum)
    );

    initial begin
       
        a = 4'b0;
        b = 4'b0;
        C_EN = 0;
        rst = 1;  
		  #10;
		  rst = 0;
		  a = 4'b1010;
        b = 4'b1111;
        C_EN = 1;
		  #10;
		  
		  a = 4'b0110;
        b = 4'b0110;
        C_EN = 1;
		  #10;
		  
		  
        $finish;
    end

endmodule
