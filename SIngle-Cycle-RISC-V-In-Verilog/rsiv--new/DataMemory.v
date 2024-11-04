module DataMemory(
    input clk,
    input [31:0] address,
    input [31:0] write_data,
    input mem_write,
    input mem_read,
    output [31:0] read_data
);
    reg [31:0] memory [0:255];

    assign read_data = (mem_read) ? memory[address >> 2] : 32'b0;

    always @(posedge clk) begin
        if (mem_write) memory[address >> 2] <= write_data;
    end
endmodule
