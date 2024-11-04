module ImmediateGenerator(
    input [31:0] instruction,
    output reg [31:0] imm_out
);
    always @(*) begin
        case (instruction[6:0])
            7'b0000011, 7'b0010011: imm_out = {{20{instruction[31]}}, instruction[31:20]};
            default: imm_out = 0;
        endcase
    end
endmodule
