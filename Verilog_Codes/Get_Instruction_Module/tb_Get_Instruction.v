`timescale 1ns / 1ps

// Name: Muhammad Attiq

module tb_Get_Instruction;

    reg clock, reset, enable, read_en;
	 
    wire [3:0] pc;
    wire [31:0] instruction;
 
    wire [5:0] opcode;
    wire [4:0] rs, rt, rd, shamt;
    wire [5:0] funct; 
    wire [15:0] immediate;
    wire isRtype, isItype;

    // Instantiate Program Counter
    Program_Counter PC1(
        .clock(clock),
        .reset(reset),
        .enable(enable),
        .pc(pc)
    );

    // Instantiate Instruction Memory
    Instruction_Memory IM1(
        .address(pc),
        .read_en(read_en),
        .instruction(instruction)
    );

    // Instantiate Instruction Decoder (Get_Instruction)
    Get_Instruction GI1(
        .instruction(instruction),
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .funct(funct),
        .immediate(immediate),
        .isRtype(isRtype),
        .isItype(isItype)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Test sequence
    initial begin
        reset = 1; enable = 0; read_en = 0;
        #15 reset = 0; enable = 1; read_en = 1;
        #500 $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0dns | PC=%0d | Instr=%h | rs=%d | rt=%d | rd=%d | R/I=%b",
                 $time, pc, instruction, rs, rt, rd, isRtype);
    end

endmodule
