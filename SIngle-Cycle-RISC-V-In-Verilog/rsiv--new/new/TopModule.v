module TopModule(
    input clk,
    input reset,
    input [3:0] alu_ctrl,          // ALU control input for operation selection
    input [31:0] test_a,           // Input a for ALU (test values from the testbench)
    input [31:0] test_b,           // Input b for ALU (test values from the testbench)
    output [31:0] alu_result,      // ALU result output
    output zero                    // Zero flag output
);
    // Declare connections between modules
    wire [31:0] pc_in, pc_out, instruction, imm_out;
    wire [31:0] read_data1, read_data2, write_data;
    wire reg_write, alu_src, mem_read, mem_write, mem_to_reg, branch;

    // Program Counter
    ProgramCounter pc(
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Instruction Memory
    InstructionMemory im(
        .address(pc_out),
        .instruction(instruction)
    );

    // Register File
    RegisterFile rf(
        .clk(clk),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .write_data(write_data),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Immediate Generator
    ImmediateGenerator ig(
        .instruction(instruction),
        .imm_out(imm_out)
    );

    // ALU with test inputs
    ALU alu(
        .a(alu_src ? imm_out : test_a),     // Select between immediate or test input a
        .b(test_b),                         // Using test input b directly for testing
        .alu_ctrl(alu_ctrl),                // ALU control signal from testbench
        .result(alu_result),
        .zero(zero)
    );

    // Control Unit (stub for now)
    ControlUnit cu(
        .opcode(instruction[6:0]),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .alu_op() // Pass alu_op to decode alu_ctrl if needed
    );

    // Note: DataMemory and additional components are omitted in this setup for simplicity

endmodule
