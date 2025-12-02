module tb_Control_ALUControl();

    reg [5:0] opcode, funct;
    wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;
    wire [3:0] ALUControlOut;

    Control ctrl(opcode, RegDst, Branch, MemRead, MemtoReg,
                 ALUOp, MemWrite, ALUSrc, RegWrite);
    ALUControl alu_ctrl(ALUOp, funct, ALUControlOut);

    initial begin
        opcode = 6'b000000; funct = 6'b100000; #10; 
        funct = 6'b100010; #10;                 
        opcode = 6'b100011; #10;                
        opcode = 6'b101011; #10;               
        opcode = 6'b000100; #10;                
        $stop;
    end
endmodule 
