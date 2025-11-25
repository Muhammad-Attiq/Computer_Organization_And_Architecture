`timescale 1ns / 1ps

module tb_getoperands();

    reg clk, reset, enable;

    wire [3:0] pc;
    wire [31:0] instruction;

    wire [4:0] rs, rt, rd;
    wire [5:0] opcode, funct;
    wire isRtype;

    wire [31:0] op1, op2;

    reg RegDst = 1;
    reg RegWrite = 0;
    reg ALUSrc = 0;       
    reg [31:0] write_data = 0;

    Program_Counter      PC  (clk, reset, enable, pc);
    Instruction_Memory   IM  (pc, 1'b1, instruction);
    Get_Instruction      GI  (instruction, opcode, rs, rt, rd, funct, isRtype);
    getoperands          GO  (op1, op2, rs, rt, rd, write_data,
                              RegDst, RegWrite, ALUSrc, clk);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; enable = 0;
        #10 reset = 0; enable = 1;

        #40;

        $finish;
    end

    initial begin
        $monitor("t=%0t | PC=%0d | rs=%0d rt=%0d rd=%0d | op1=%0d op2=%0d ALUSrc=%0d",
                  $time, pc, rs, rt, rd, op1, op2, ALUSrc);
    end

endmodule
