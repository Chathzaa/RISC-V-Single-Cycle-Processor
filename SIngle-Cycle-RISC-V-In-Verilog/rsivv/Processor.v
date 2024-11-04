module Processor(
    input clk, reset
);
    wire [3:0] pc, next_pc, instruction, alu_result, read_data1, read_data2;
    wire reg_write;
    wire [1:0] alu_ctrl;
    wire [1:0] read_reg1 = instruction[3:2], read_reg2 = instruction[1:0];

    ProgramCounter pc_reg(clk, reset, next_pc, pc);
    InstructionMemory im(pc, instruction);
    RegisterFile rf(clk, read_reg1, read_reg2, read_reg2, alu_result, reg_write, read_data1, read_data2);
    ALU alu(read_data1, read_data2, alu_ctrl, alu_result);
    ControlUnit cu(instruction[3:0], reg_write, alu_ctrl);

    assign next_pc = pc + 4'b0001; // Increment PC by 1
endmodule
