module adder_256 (
    input  [255:0] a,       // First 256-bit input
    input  [255:0] b,       // Second 256-bit input
    input          C_EN,    // Carry enable
    input          rst,     // Reset signal
    output [255:0] sum      // 256-bit output sum
);
	 genvar i;
    generate
        for (i = 0; i < 256; i = i + 1) begin : fa
            full_adder fa_inst (
                .a(a[i]),
                .b(b[i]),
                .C_EN(C_EN),
                .rst(rst),
                .s(sum[i])
            );
        end
    endgenerate
endmodule
