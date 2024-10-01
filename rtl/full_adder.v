module full_adder(
    input a, b, C_EN, rst,
    output s
);
    reg intermediate_carry;
    wire carry_in, carry_out;

    assign carry_in = intermediate_carry;

    // Instantiate the basic adder
    adder add (
         .a(a), .b(b), .cin(carry_in),
         .sum(s), .carry(carry_out)
    );

    // Always block to update carry on clock enable
    always @(posedge C_EN or posedge rst) begin
        if (rst)
            intermediate_carry <= 1'b0;  // Reset the carry to 0
        else if (C_EN)
            intermediate_carry <= carry_out;  // Update carry based on the current addition
    end
endmodule

module adder (
    input a,b,cin,
    output sum,carry
);

assign {carry,sum} = a+b+cin;

endmodule
