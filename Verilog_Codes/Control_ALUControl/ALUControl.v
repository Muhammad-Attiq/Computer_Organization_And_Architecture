module ALUControl(
    input  [1:0] ALUOp,
    input  [5:0] funct,
    output reg [3:0] ALUControl
);

    always @(*) begin
        casex ({ALUOp, funct})

            8'b10_100000: ALUControl = 4'b0010; 
            8'b10_100010: ALUControl = 4'b0110; 
            8'b10_100100: ALUControl = 4'b0000; 
            8'b10_100101: ALUControl = 4'b0001; 
            8'b10_101010: ALUControl = 4'b0111; 
				
            8'b00_xxxxxx: ALUControl = 4'b0010;

            8'b01_xxxxxx: ALUControl = 4'b0110;

            default: ALUControl = 4'b0000;
        endcase
    end
endmodule
