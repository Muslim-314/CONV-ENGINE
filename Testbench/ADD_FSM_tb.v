module ADD_FSM_tb;

    // Inputs to the ADD_FSM module
    reg clk;
    reg En;

    // Outputs from the ADD_FSM module
    wire [7:0] RWLv1;
    wire [7:0] RWLv2;
    wire [7:0] WWLp;
    wire CLR;
    wire DONE;
    wire C_EN;

    // Instantiate the ADD_FSM module
    ADD_FSM uut (
        .clk(clk),
        .En(En),
        .RWLv1(RWLv1),
        .RWLv2(RWLv2),
        .WWLp(WWLp),
        .C_EN(C_EN),
        .CLR(CLR),
        .DONE(DONE)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (50 MHz)
    end

    // Test logic
    initial begin
        // Initialize input signals
        En = 0;

        // Apply reset for some time
        #10;

        // Set En HIGH after 20 time units
        En = 1;
        #100; // Run simulation for some time after enabling FSM
        
        En = 0; // Disable the FSM after running for a while
        #500;
        
        $finish; // End simulation
    end

    // Monitor key output signals
    initial begin
        $monitor("Time: %0d | RWLv1: %b | RWLv2: %b | WWLp: %b | C_EN: %b | CLR: %b | DONE: %b",
                 $time, RWLv1, RWLv2, WWLp, C_EN, CLR, DONE);
    end

endmodule
