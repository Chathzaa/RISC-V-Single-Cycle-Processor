module RegisterFile(
    input clk,
    input [1:0] read_reg1, read_reg2, write_reg,
    input [3:0] write_data,
    input reg_write,
    output reg [3:0] read_data1, read_data2
);
    reg [3:0] registers [0:3]; // 4 registers for simplicity

    always @(posedge clk) begin
        if (reg_write)
            registers[write_reg] <= write_data;
    end

    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end
endmodule
