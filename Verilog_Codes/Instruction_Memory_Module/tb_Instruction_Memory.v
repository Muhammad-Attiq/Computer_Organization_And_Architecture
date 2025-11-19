`timescale 1ns / 1ps

module tb_Instruction_Memory();

    reg  [3:0] address;
    reg  read_en;
    wire [31:0] instruction;

    Instruction_Memory uut (
        .address(address),
        .read_en(read_en),
        .instruction(instruction)
    );

    initial begin
        $monitor("Time=%0t | address=%d | instruction=%h",
                 $time, address, instruction);

        read_en = 1;

        address = 0; #10;
        address = 1; #10;
        address = 2; #10;
        address = 3; #10;
        address = 4; #10;
        address = 5; #10;
        address = 6; #10;
        address = 7; #10;

        $finish;
    end

endmodule
