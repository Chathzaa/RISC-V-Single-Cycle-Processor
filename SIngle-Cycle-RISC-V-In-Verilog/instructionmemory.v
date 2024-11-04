module instructionmemory #(parameter Width = 32)(
    input [Width-1:0] address,
    output [Width-1:0] RD
);

reg [Width-1:0] mem1[511:0];

initial begin
    mem1[0] = 32'h002081B3;
    mem1[4] = 32'h403202B3;
    mem1[8] = 32'h00308383;
    mem1[12] = 32'h0013F333;
    mem1[16] = 32'h001112B3;
    mem1[20] = 32'h001122B3;
    mem1[24] = 32'h00210463;
    mem1[28] = 32'h001132B3;
    mem1[32] = 32'h001142B3;
    mem1[36] = 32'h001152B3;
    mem1[40] = 32'h401152B3;
    mem1[44] = 32'h008002EF;
    mem1[48] = 32'h00110293;
    mem1[52] = 32'h00312293;
    mem1[56] = 32'h00517293;
    mem1[60] = 32'h00211293;
    mem1[64] = 32'h002102E7;
end

assign RD = mem1[address];

endmodule
