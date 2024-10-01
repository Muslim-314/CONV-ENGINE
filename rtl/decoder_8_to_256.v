module decoder_8_to_256(
    input [7:0] in,        
    input       enable,    
    output reg [255:0] out 
);

    always @(*) begin
        if (enable) begin
            out = 256'b0;
            out[in] = 1'b1;
        end else begin
            out = 256'b0;
        end
    end

endmodule
