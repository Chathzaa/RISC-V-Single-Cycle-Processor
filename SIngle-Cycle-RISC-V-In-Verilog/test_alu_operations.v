`timescale 1ns / 1ps

module test_alu_operations;

    // Define clock and control signals
    reg clk;
    reg reset;  // Optional, based on your architecture
    reg PCen;   // Enable signal for Program Counter

    // Instantiate the CPU (architecture) top module
    architecture uut (
        .clk(clk),
        .PCen(PCen)
        // Add other inputs/outputs if your CPU requires them (e.g., reset)
    );

    // Clock generation (100 MHz clock)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        PCen = 1;
        reset = 1;       // Assuming a reset input is used in the architecture
        #10 reset = 0;   // Release reset after 10 ns

        // Wait for some time to observe the changes
        #100;            // Adjust delay as needed for your test

        $stop;           // Stop simulation
    end

    // Monitoring key signals for debugging
    initial begin
        $monitor("Time=%0d, ALUOut=%h, ControlSignal=%b", $time, uut.ALUOut, uut.Control);
        // Adjust signal names based on your actual module signals
    end

endmodule
