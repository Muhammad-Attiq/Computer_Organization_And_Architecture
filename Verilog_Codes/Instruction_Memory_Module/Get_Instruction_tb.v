`timescale 1ns/1ps

module Get_Instruction_tb;
    reg clk;
    reg reset;
    reg enable;
    reg read_en;
    wire [31:0] instruction;
  
    Get_Instruction uut (
        .clock(clk),
        .reset(reset),
        .enable(enable),
        .read_en(read_en),
        .instruction(instruction)
    );

     initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
  
     initial begin
        reset = 1;
        enable = 0;
        read_en = 0;
        #12;            
        reset = 0;     
        read_en = 1;    
        #10;
        enable = 1;     
        #200;          
        $finish;
    end
  
endmodule
