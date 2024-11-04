module RegisterFile(
    input clk,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    input reg_write,
    output [31:0] read_data1,
    output [31:0] read_data2
);
    reg [31:0] registers [0:31];

    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    always @(posedge clk) begin
        if (reg_write) 
            registers[rd] <= write_data;
    end
endmodule
