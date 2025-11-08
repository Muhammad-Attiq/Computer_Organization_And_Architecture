module tb_pcplusadder;
  reg clk, rst, enable;
  wire [31:0] pc;
  
  pcplusadder uut(.clk(clk), .rst(rst), .enable(enable), .pc(pc));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    enable = 0;
    rst = 1;
    #10;
    $display("After reset PC = %0d", pc);
    
    rst = 0;
    enable = 1;
    #30;
    $display("Counting to three  PC = %0d", pc);
    
    enable = 0;
    #20;
    $display("After disabling PC = %0d", pc);
    
    rst = 1;
    #10;
    $display("After reset PC = %0d", pc);
    
  end
endmodule
