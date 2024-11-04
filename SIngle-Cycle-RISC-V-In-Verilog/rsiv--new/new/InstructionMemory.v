module InstructionMemory(
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] mem [0:255];

    initial begin
        mem[0] = 32'h00000000; // Sample instruction (NOP)
        // Initialize memory with more instructions as needed
    end

    assign instruction = mem[address >> 2];
endmodule
