module ControlUnit(
    input [6:0] opcode,
    output reg reg_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg [3:0] alu_op
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                alu_op = 4'b0000;
                reg_write = 1;
                alu_src = 0;
                mem_to_reg = 0;
                mem_read = 0;
                mem_write = 0;
                branch = 0;
            end
            // Handle more opcode cases as needed
        endcase
    end
endmodule
