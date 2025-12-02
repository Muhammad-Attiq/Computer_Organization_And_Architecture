module ALUControl(
    input  [1:0] ALUOp,
    input  [5:0] funct,
    output reg [3:0] ALUControl
);

    always @(*) begin
        casex ({ALUOp, funct})
            8'b10_100000: ALUControl = 4'b0010; // ADD
            8'b10_100010: ALUControl = 4'b0110; // SUB
            8'b10_100100: ALUControl = 4'b0000; // AND
            8'b10_100101: ALUControl = 4'b0001; // OR
            8'b10_101010: ALUControl = 4'b0111; // SLT

            8'b00_xxxxxx: ALUControl = 4'b0010; // LW/SW ? ADD
            8'b01_xxxxxx: ALUControl = 4'b0110; // BEQ ? SUB
            default:      ALUControl = 4'b0000;
        endcase
    end
endmodule
