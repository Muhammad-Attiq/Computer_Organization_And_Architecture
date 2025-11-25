`timescale 1ns / 1ps

module getoperands(
    output [31:0] operand1,
    output [31:0] operand2,
    input  [4:0] rs,
    input  [4:0] rt,
    input  [4:0] rd,
    input  [31:0] write_data,
    input  RegDst,
    input  RegWrite,
    input  ALUSrc,           
    input  clk
);

    reg [31:0] registers [0:31];

    wire [4:0] write_reg = (RegDst == 1) ? rd : rt;

    assign operand1 = registers[rs];

    assign operand2 = (ALUSrc == 1) ? 32'd0 : registers[rt];

    always @(posedge clk) begin
        if (RegWrite)
            registers[write_reg] <= write_data;
    end

    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)
            registers[i] = i;   
    end

endmodule
