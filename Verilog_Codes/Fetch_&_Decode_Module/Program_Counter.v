`timescale 1ns / 1ps

module Program_Counter(
    input        clock,
    input        reset,
    input        enable,
    output reg [3:0] pc
);

    always @(posedge clock or posedge reset) begin
        if (reset)
            pc <= 0;
        else if (enable)
            pc <= pc + 1;
    end

endmodule 
