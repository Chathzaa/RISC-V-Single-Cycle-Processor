module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_ctrl,
    output reg [31:0] result,
    output zero
);
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = a + b;        // ADD
            4'b0001: result = a - b;        // SUB
            4'b0010: result = a & b;        // AND
            4'b0011: result = a | b;        // OR
            4'b0100: result = a ^ b;        // XOR
            4'b0101: result = a << b;       // Shift Left
            4'b0110: result = a >> b;       // Shift Right
            default: result = 0;
        endcase
    end

    assign zero = (result == 0);
endmodule
