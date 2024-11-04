module Testbench;
    reg clk, reset;
    reg [3:0] alu_ctrl;
    reg [31:0] test_a, test_b;
    wire [31:0] alu_result;
    wire zero;

    // Instantiate TopModule
    TopModule uut (
        .clk(clk),
        .reset(reset),
        .alu_ctrl(alu_ctrl),
        .test_a(test_a),
        .test_b(test_b),
        .alu_result(alu_result),
        .zero(zero)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Test ADD operation
        test_a = 32'd10;
        test_b = 32'd15;
        alu_ctrl = 4'b0000;  // ADD operation
        #10;

        // Test SUB operation
        alu_ctrl = 4'b0001;  // SUB operation
        #10;

        // Test AND operation
        alu_ctrl = 4'b0010;  // AND operation
        #10;

        // Test OR operation
        alu_ctrl = 4'b0011;  // OR operation
        #10;

        // Test XOR operation
        alu_ctrl = 4'b0100;  // XOR operation
        #10;

        // Test Shift Left
        alu_ctrl = 4'b0101;  // Shift Left operation
        #10;

        // Test Shift Right
        alu_ctrl = 4'b0110;  // Shift Right operation
        #10;

        // Stop the simulation
        $stop;
    end
endmodule
