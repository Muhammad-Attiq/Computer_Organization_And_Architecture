module pcplusadder(input clk, rst, enable, output reg [31:0] pc);
  always@(posedge clk or posedge rst) begin
  if(rst) begin
    pc <= 32'b0;
  end
  else if(enable) begin
    pc <= pc + 32'b1;
  end
  end
endmodule
