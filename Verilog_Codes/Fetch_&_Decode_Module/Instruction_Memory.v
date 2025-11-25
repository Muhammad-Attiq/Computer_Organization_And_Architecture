`timescale 1ns / 1ps

module Instruction_Memory(
    input  [3:0] address,
    input        read_en,
    output reg [31:0] instruction
);

    reg [31:0] memory [0:14];

    initial begin
        memory[0] = 32'h018D4820;  // add $9,  $12, $13
        memory[1] = 32'h01CE5020;  // add $10, $14, $15
        memory[2] = 32'h01494022;  // sub $8,  $10, $9

        memory[3] = 32'h00000000;
        memory[4] = 32'h00000000;
        memory[5] = 32'h00000000;
        memory[6] = 32'h00000000;
        memory[7] = 32'h00000000;
        memory[8] = 32'h00000000;
        memory[9] = 32'h00000000;
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
