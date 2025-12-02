module tb_ALU();

    reg [31:0] A, B;
    reg [3:0] ALUControl;
    wire [31:0] Result;
    wire Zero;

    ALU dut(A, B, ALUControl, Result, Zero);

    initial begin
        A = 10; B = 5;

        ALUControl = 4'b0010; #10; // ADD
        ALUControl = 4'b0110; #10; // SUB
        ALUControl = 4'b0000; #10; // AND
        ALUControl = 4'b0001; #10; // OR
        ALUControl = 4'b0111; #10; // SLT 

        $stop;
    end
endmodule 
