//module ADD_FSM(
//	input            clk,
//	input            En,
//	output     [7:0] RWLv1,
//	output     [7:0] RWLv2,
//	output     [7:0] WWLp,
//	output reg       C_EN,
//	output           CLR,
//	output reg       DONE
//);
//
//	localparam IDLE        = 3'b000,
//				  LATCH_CARRY = 3'b001,
//				  ADD         = 3'b010, 
//			     STORE       = 3'b011,
//			     WAIT        = 3'b100;
//				   
//	reg [2:0] state, next_state; 
//	reg [2:0] counter;
//	reg [8:0] RWLv1_reg;
//	reg [8:0] RWLv2_reg;
//	reg [8:0] WWLp_reg;
//	wire start;
//
//	assign RWLv1 = (state == ADD | state == LATCH_CARRY)  ? RWLv1_reg[8:1] : 8'h00;
//	assign RWLv2 = (state == ADD | state == LATCH_CARRY)  ? RWLv2_reg[8:1] : 8'h00;
//	assign WWLp =  (state == STORE) ? WWLp_reg[8:1] : 8'h00;
//
//	START_FSM fsm_inst (
//		.clk(clk), 
//		.En(En), 
//		.CLR(CLR), 
//		.start(start)
//	);
//
//	always @(*) begin
//		case(state)
//			IDLE: begin
//				RWLv1_reg 	= 9'h01; 
//				RWLv2_reg 	= 9'h01; 
//				WWLp_reg  	= 9'h01; 
//				C_EN  		= 1'b0;
//				DONE  		= 1'b0;
//				next_state = (start) ? ADD : IDLE;
//			end
//			ADD: begin
//				RWLv1_reg = RWLv1_reg << 1; 
//				RWLv2_reg = RWLv2_reg << 1; 
//				C_EN      = 1'b0;
//				DONE      = 1'b0;
//				next_state = LATCH_CARRY;
//			end
//			LATCH_CARRY: begin
//				C_EN      = 1'b1;
//				DONE      = 1'b0;
//				next_state = STORE;
//			end
//			STORE: begin
//				WWLp_reg   = WWLp_reg << 1; 
//				C_EN       = 1'b0;
//				DONE       = 1'b0;
//				next_state = (counter == 3'b111) ? WAIT : ADD;
//			end
//			WAIT: begin
//				DONE = 1'b1;
//				C_EN = 1'b0; 
//				next_state = IDLE;
//			end
//			default: next_state = IDLE;
//		endcase
//	end
//		
//	always @(posedge clk) begin
//		if (state == IDLE)
//			counter <= 3'b000;  // Reset the counter in the IDLE state
//		else if (state == STORE)
//			counter <= counter + 1'b1;  // Increment counter in the STORE state
//		
//		state <= next_state; // Use non-blocking assignment
//	end
//
//endmodule

//module ADD_FSM(
//	input            clk,
//	input            En,
//	output     [7:0] RWLv1,
//	output     [7:0] RWLv2,
//	output     [7:0] WWLp,
//	output reg       C_EN,
//	output           CLR,
//	output reg       DONE
//);
//
//	localparam IDLE        = 2'b00,
//				  ADD         = 2'b01,
//			     CHECK       = 2'b10,
//			     WAIT        = 2'b11;
//				   
// 	reg [2:0] state, next_state; 
//	reg [2:0] counter;
//	reg [8:0] RWLv1_reg;
//	reg [8:0] RWLv2_reg;
//	reg [8:0] WWLp_reg;
//	wire start;
//	assign RWLv1 = (state == ADD | state == CHECK)  ? RWLv1_reg[8:1] : 8'h00;
//	assign RWLv2 = (state == ADD | state == CHECK)  ? RWLv2_reg[8:1] : 8'h00;
//	assign WWLp =  (state == CHECK)  ? WWLp_reg[8:1] : 8'h00;
//	START_FSM fsm_inst (
//		.clk(clk), 
//		.En(En), 
//		.CLR(CLR), 
//		.start(start)
//	);
//	always @(*) begin
//		case(state)
//			IDLE: begin
//				RWLv1_reg 	= 9'h01; 
//				RWLv2_reg 	= 9'h01; 
//				WWLp_reg  	= 9'h01; 
//				C_EN  		= 1'b0;
//				DONE  		= 1'b0;
//				next_state = (start) ? ADD : IDLE;
//			end
//			ADD: begin
//				RWLv1_reg = RWLv1_reg << 1; 
//				RWLv2_reg = RWLv2_reg << 1; 
//				WWLp_reg  = WWLp_reg << 1;
//				C_EN      = 1'b0;
//				DONE      = 1'b0;
//				next_state = CHECK;
//			end
//			CHECK:begin
//				C_EN      = 1'b1;
//				DONE      = 1'b0;
//				next_state = (counter == 3'b111)? WAIT: ADD;
//			end
//			WAIT: begin
//				C_EN      = 1'b0;
//				DONE      = 1'b1;
//				next_state = (En == 1'b0)? IDLE : WAIT;
//			end
//			default: next_state = IDLE;
//		endcase
//	end
//	always @(posedge clk) begin
//		if (state == IDLE)
//			counter <= 3'b000;  // Reset the counter in the IDLE state
//		else if (state == CHECK)
//			counter <= counter + 1'b1;  // Increment counter in the STORE state
//		state <= next_state; // Use non-blocking assignment
//	end
//endmodule


module ADD_FSM(
	input            clk,
	input            En,

	output     [7:0] RWLv1,
	output     [7:0] RWLv2,
	output     [7:0] WWLp,
	output reg       C_EN,
	output           CLR,
	output reg       DONE
);

	localparam IDLE        = 3'b000,
				  ADD         = 3'b001,
				  STORE       = 3'b010,
			     CHECK       = 3'b011,
			     WAIT        = 3'b100;
				   
 	reg [3:0] state, next_state; 
	reg [2:0] counter;
	reg [8:0] RWLv1_reg;
	reg [8:0] RWLv2_reg;
	reg [8:0] WWLp_reg;
	wire start;
	assign RWLv1 = (state == ADD | state == STORE | state == CHECK )  ? RWLv1_reg[8:1] : 8'h00;
	assign RWLv2 = (state == ADD | state == STORE | state == CHECK )  ? RWLv2_reg[8:1] : 8'h00;
	assign WWLp =  (state == STORE)  ? WWLp_reg[8:1] : 8'h00;
	START_FSM fsm_inst (
		.clk(clk), 
		.En(En), 
		.CLR(CLR), 
		.start(start)
	);
	always @(*) begin
		case(state)
			IDLE: begin
				RWLv1_reg 	= 9'h01; 
				RWLv2_reg 	= 9'h01; 
				WWLp_reg  	= 9'h01; 
				C_EN  		= 1'b0;
				DONE  		= 1'b0;
				next_state = (start) ? ADD : IDLE;
			end
			ADD: begin
				RWLv1_reg = RWLv1_reg << 1; 
				RWLv2_reg = RWLv2_reg << 1; 
				WWLp_reg  = WWLp_reg << 1;
				C_EN      = 1'b0;
				DONE      = 1'b0;
				next_state = STORE;
			end
			STORE:begin
				C_EN      = 1'b0;
				DONE      = 1'b0;
				next_state = CHECK;
			end
			CHECK:begin
				C_EN      = 1'b1;
				DONE      = 1'b0;
				next_state = (counter == 3'b111)? WAIT: ADD;
			end
			WAIT: begin
				C_EN      = 1'b0;
				DONE      = 1'b1;
				next_state = (En == 1'b0)? IDLE : WAIT;
			end
			default: next_state = IDLE;
		endcase
	end
	always @(posedge clk) begin
		if (state == IDLE)
			counter <= 3'b000;  // Reset the counter in the IDLE state
		else if (state == CHECK)
			counter <= counter + 1'b1;  // Increment counter in the STORE state
		state <= next_state; // Use non-blocking assignment
	end
endmodule
