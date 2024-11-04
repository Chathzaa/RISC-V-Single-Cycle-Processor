module ALU(
    input [3:0] a, b,
    input [1:0] alu_ctrl, // Control signals for operation
    output reg [3:0] result
);
    always @(*) begin
        case (alu_ctrl)
            2'b00: result = a + b;      // Addition
            2'b01: result = a - b;      // Subtraction
            default: result = 4'b0;
        endcase
    end
endmodule
