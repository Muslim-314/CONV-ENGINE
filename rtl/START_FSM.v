module START_FSM (
    input clk,       // Clock signal
    input En,        // Enable signal
    output reg CLR,  // Clear signal  (1 clk cycle)
    output reg start // Start signal (next clk cycle)
);
	localparam IDLE         = 2'b00, 
				  CLR_STATE    = 2'b01, 
				  START_STATE  = 2'b10,
				  WAIT         = 2'b11;			  
	reg [1:0] state, next_state; 
	always@(posedge clk)begin
		state = next_state;
	end
	
	always@(*)begin
		case(state)
			IDLE: begin
				CLR   = 1'b0;
				start = 1'b0;
				next_state = (En)? CLR_STATE : IDLE;
			end
			CLR_STATE: begin
				CLR   = 1'b1;
				start = 1'b0;
				next_state = START_STATE;
			end
			
			START_STATE: begin
				CLR   = 1'b0;
				start = 1'b1;
				next_state = WAIT;
			end
			WAIT: begin
				CLR   = 1'b0;
				start = 1'b0;
				next_state = (En)? WAIT : IDLE;
			end
			default: begin
				CLR        = 1'b0;
				start      = 1'b0;
				next_state = IDLE;
			end
		endcase
	end
endmodule
