module architecture(
    input clk,
    input PCen  // Ensure this is a 1-bit signal
);

wire [63:0] d, e, Writedata, immediateout, RD1, RD2, Mux1output, ALUOut, DataOutput, shiftoutput, Mux10output;
wire [31:0] RD, PC, PCPlus4;
wire [31:0] branchaddress, PCinput;
wire [3:0] Control; 
wire [1:0] Aluop;
wire [1:0] MemtoReg; // Ensure consistent width of 1-bit if used across modules
wire [31:0] PCaddress;

// Adjust bit widths in instantiations to match their expected sizes
MUX #(32) M9(PCaddress, ALUOut[31:0], jump, PCinput);
PCCounter P1(clk, PCen, PCinput, PC);
adder A1(PC, PCPlus4);
instructionmemory I1(PC, RD);

// Instantiate `mainController` with the correct number of arguments
mainController M1(
    .Opcode(RD[6:0]),
    .ALUSrc(ALUSrc), 
    .MemtoReg(MemtoReg), 
    .RegWrite(RegWrite), 
    .MemRead(MemRead), 
    .MemWrite(MemWrite), 
    .Branch(Branch), 
    .jump(jump), 
    .Aluop(Aluop)
);

Registerfile R1(clk, RegWrite, RD[19:15], RD[24:20], RD[11:7], Writedata[31:0], RD1[31:0], RD2[31:0]);
immediategeneration S1(RD[31:0], immediateout);
MUX #(64) M4(RD2, immediateout, ALUSrc, Mux1output);
ALUControl A3(Aluop, RD[30], RD[14:12], Control);
MUX #(64) M10(RD1, {32'b0, PC}, Asel, Mux10output);
assign d = {{32{Mux10output[31]}}, Mux10output[31:0]};
ALU A2(Control, d, Mux1output, ALUOut, Zero);
DataMemory D1(clk, MemWrite, MemRead, ALUOut[31:0], RD2[31:0], DataOutput);
assign e = {{32{PCPlus4[31]}}, PCPlus4[31:0]};
MUX1 #(64) M2(ALUOut, DataOutput, e, MemtoReg, Writedata);
and Q1(andoutput, Branch, Zero);
shift S12(immediateout, shiftoutput);
add A23(PC, shiftoutput[31:0], branchaddress);
MUX #(32) M3(PCPlus4, branchaddress, andoutput, PCaddress);

endmodule
