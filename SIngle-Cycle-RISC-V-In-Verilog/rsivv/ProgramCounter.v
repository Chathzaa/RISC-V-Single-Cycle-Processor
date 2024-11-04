module ProgramCounter(
    input clk, 
    input reset, 
    input [3:0] next_pc, 
    output reg [3:0] pc
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 4'b0;
        else
            pc <= next_pc;
    end
endmodule
