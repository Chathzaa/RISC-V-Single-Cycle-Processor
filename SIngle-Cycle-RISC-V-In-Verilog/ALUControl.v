module ALUControl(
    input [1:0] Aluop,
    input funct7,
    input [2:0] funct3,
    output reg [3:0] Control
);

always @(*) begin
    case (Aluop)
        2'b00 : Control <= 4'b0010;
        2'b01 : Control <= 4'b0110;
        2'b10 : case({funct7, funct3})
            4'b0000 : Control <= 4'b0010;
            4'b1000 : Control <= 4'b0110;
            4'b0111 : Control <= 4'b0000;
            4'b0110 : Control <= 4'b0001;
            4'b0001 : Control <= 4'b0011;
            4'b0010 : Control <= 4'b0100;
            4'b0011 : Control <= 4'b0101;
            4'b0100 : Control <= 4'b0111;
            4'b0101 : Control <= 4'b1000;
            4'b1101 : Control <= 4'b1010;
            default : Control <= 4'bxxxx;
        endcase
        2'b11 : case({funct7, funct3})
            4'b0000 : Control <= 4'b0010;
            4'b0010 : Control <= 4'b0100;
            4'b0011 : Control <= 4'b0101;
            4'b0100 : Control <= 4'b0111;
            4'b0110 : Control <= 4'b0001;
            4'b0111 : Control <= 4'b0000;
            4'b0001 : Control <= 4'b0011;
            4'b0101 : Control <= 4'b1000;
            4'b1101 : Control <= 4'b1010;
            default : Control <= 4'bxxxx;
        endcase
        default: Control <= 4'bxxxx;
    endcase
end

endmodule
