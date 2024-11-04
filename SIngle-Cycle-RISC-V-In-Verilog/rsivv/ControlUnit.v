module ControlUnit(
    input [3:0] opcode,
    output reg reg_write,
    output reg [1:0] alu_ctrl
);
    always @(*) begin
        case (opcode)
            4'b0000: begin // ADD
                reg_write = 1;
                alu_ctrl = 2'b00;
            end
            4'b0001: begin // SUB
                reg_write = 1;
                alu_ctrl = 2'b01;
            end
            default: begin
                reg_write = 0;
                alu_ctrl = 2'b00;
            end
        endcase
    end
endmodule
