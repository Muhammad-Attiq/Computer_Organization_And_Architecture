`timescale 1ns / 1ps

module Get_Instruction(
    input  [31:0] instruction,
    output [5:0] opcode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [5:0] funct,
    output reg isRtype
);

assign opcode = instruction[31:26];

always @(*) begin
    if (opcode == 6'b000000) begin
        isRtype = 1;
        rs = instruction[25:21];
        rt = instruction[20:16];
        rd = instruction[15:11];
        funct = instruction[5:0];
    end else begin
        isRtype = 0;
        rs = 0;
        rt = 0;
        rd = 0;
        funct = 0;
    end
end

endmodule
