module Instruction_Memory(
  input read_en,
  input [3:0] address,
  output reg [31:0] instruction
);
  reg [31:0] memory [0:14];
  initial begin
    memory[0] = 32'h8c0c0000;
    memory[1] = 32'h8c0d0001;
    memory[2] = 32'h8c0e0002;  
    memory[3] = 32'h8c0f0003;  
    memory[4] = 32'h01ad4820;  
    memory[5] = 32'h01cf5020;  
    memory[6] = 32'h01494022;  
    memory[7] = 32'hac080004;  
  end

  always@(*) begin
    if(read_en)
      instruction <= memory[address];
    else
      instruction <= 32'h00000000;
  end
endmodule
