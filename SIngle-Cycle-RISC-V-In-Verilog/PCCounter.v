module PCCounter #(parameter Width = 32) (
    input clk,
    input PCen,
    input [Width-1:0] PC1,
    output reg [Width-1:0] PC
);

always @(posedge clk) begin
    if (PCen)
        PC <= PC1;
    else
        PC <= PC;
end

endmodule
