`timescale 1ns / 1ps
module Instruction_Memory(
    input  [3:0] address,
    input        read_en,
    output reg [31:0] instruction
);

    reg [31:0] memory [0:14];  

    initial begin
        memory[0] = 32'h8c0c0000;  
        memory[1] = 32'h8c0d0001;  
        memory[2] = 32'h8c0e0002;  
        memory[3] = 32'h8c0f0003;  
        memory[4] = 32'h018d4820;  
        memory[5] = 32'h01cf5020;  
        memory[6] = 32'h01494022;  
        memory[7] = 32'hac080004;  
	    memory[8]  = 32'h00000000;  
  		memory[9]  = 32'h00000000;  
  		memory[10] = 32'h00000000;  
  		memory[11] = 32'h00000000; 
  		memory[12] = 32'h00000000;  
  		memory[13] = 32'h00000000;  
	    memory[14] = 32'h00000000;  
    end

    always @(*) begin
        if (read_en)
            instruction = memory[address];
        else
            instruction = 32'b0;
    end

endmodule
