module InstructionMemory(
    input [3:0] address, 
    output reg [3:0] instruction
);
    reg [3:0] memory [0:15]; // 16 instructions

    initial begin
        $readmemh("instructions.mem", memory); // Load instructions from file
    end

    always @(*) begin
        instruction = memory[address];
    end
endmodule
