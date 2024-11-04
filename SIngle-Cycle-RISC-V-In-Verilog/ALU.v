module ALU #(parameter Width = 32)(
    input [3:0] controlsignal, 
    input [Width-1:0] A1, A2,
    output reg [Width-1:0] Y, 
    output zero
);

always @(*) begin
    case (controlsignal)
        4'b0000: Y = A1 & A2;
        4'b0001: Y = A1 | A2;
        4'b0010: Y = A1 + A2;
        4'b0110: Y = A1 - A2;
        4'b0011: Y = A1 << A2;
        4'b0100: Y = ((~A1 + 1) < (~A2 + 1)) ? 1 : 0;
        4'b0101: Y = (A1 < A2) ? 1 : 0;
        4'b0111: Y = A1 ^ A2;
        4'b1000: Y = A1 >> A2;
        4'b1010: Y = A1 >>> A2;
        default: Y = {Width{1'bx}};
    endcase
end

assign zero = (Y == 0) ? 1 : 0;
endmodule
