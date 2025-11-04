// TESTBECNH
`timescale 1ns/1ps 
module tb_EvenOnesDetector; 
    reg clk, rst, din; 
    wire out; 
    EvenOnesDetector uut(clk, rst, din, out); 
    always #5 clk = ~clk;     
    initial begin 
        $dumpfile("dump.vcd"); 
        $dumpvars(0, tb_KeypadScanner); 
        $monitor("Time=%0t | din=%b | out=%b", $time, din, out); 
        clk = 0; rst = 1; din = 0; #10; 
        rst = 0; 
        din = 0; #10; 
        din = 1; #10; 
        din = 1; #10; 
        din = 0; #10; 
        din = 1; #10; 
        din = 1; #10; 
        din = 0; #10; 
        $finish; 
    end 
endmodule
