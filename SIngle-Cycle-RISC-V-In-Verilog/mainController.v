module mainController(
    input [6:0] Opcode,
    output ALUSrc,
    output MemtoReg,  // 1-bit signal, ensure consistent use across all modules
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output jump,
    output [1:0] Aluop
);

reg [8:0] control;

assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, jump, Aluop} = control;

always @(*) begin
    case (Opcode)
        7'b0110011: control <= 9'b001000010;
        7'b0000011: control <= 9'b111100000;
        7'b0100011: control <= 9'b100010000;
        7'b1100011: control <= 9'b000001001;
        7'b0010011: control <= 9'b101000011;
        7'b1100111: control <= 9'b111001000;
        7'b1101111: control <= 9'b111001000;
        default: control <= 9'b000000000;
    endcase
end

endmodule
