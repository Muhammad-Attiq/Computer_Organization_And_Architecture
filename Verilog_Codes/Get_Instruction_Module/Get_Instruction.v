`timescale 1ns / 1ps

module Get_Instruction(
    input  [31:0] instruction,
    output [5:0] opcode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] shamt,
    output reg [5:0] funct,
    output reg [15:0] immediate,
    output reg isRtype,
    output reg isItype
);

assign opcode = instruction[31:26];

always @(*) begin
    if (opcode == 6'b000000) begin 
        isRtype   = 1'b1;
        isItype   = 1'b0;
        rs        = instruction[25:21];
        rt        = instruction[20:16];
        rd        = instruction[15:11];
        shamt     = instruction[10:6];
        funct     = instruction[5:0];
        immediate = 16'b0;
    end else begin
        isRtype   = 1'b0;
        isItype   = 1'b1;
        rs        = instruction[25:21];
        rt        = instruction[20:16];
        immediate = instruction[15:0];
        rd        = 5'b0;
        shamt     = 5'b0;
        funct     = 6'b0;
    end
end
endmodule 
