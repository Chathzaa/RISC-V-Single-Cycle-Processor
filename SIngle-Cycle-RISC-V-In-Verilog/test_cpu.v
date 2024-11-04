`timescale 1ns / 1ps

module test_cpu;

    // Clock and control signals
    reg clk;
    reg PCen;  // Program Counter enable signal

    // Instantiate the architecture (CPU top-level module)
    architecture uut (
        .clk(clk)
        // Connect additional signals here if your architecture module requires them
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Generate a 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        PCen = 1;

        // Run the simulation
        #10;  // Wait for initial conditions

        // Simulate with PC enabled
        #50;
        PCen = 0; // Disable the PC after some time (optional)

        // Test further functionality
        #500;  // Adjust based on the length of simulation needed

        // End the simulation
        $stop;
    end

    // Monitor key signals to track changes
    initial begin
        $monitor("Time=%0d | PC=%h | ALUOut=%h | MemRead=%b | MemWrite=%b",
                 $time, uut.PC, uut.ALUOut, uut.MemRead, uut.MemWrite);
        // Add or adjust signal names according to the exact signals in architecture module
    end

endmodule
