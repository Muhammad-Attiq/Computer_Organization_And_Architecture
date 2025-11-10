module Get_Instruction(input clock,
  input reset, input enable,
  input read_en, output [31:0] instruction);

  reg [31:0] PC;

  always@(posedge clock or posedge reset) begin
    if(reset)
      PC <= 0;
    else 
      PC <= PC + 4;
  end

  Instruction_Memory IM(
    .address([5:2] PC),
    .read_en(read_en),
    .instruction(instruction)
  );
  
endmodule
