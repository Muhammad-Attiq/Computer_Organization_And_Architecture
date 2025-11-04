// TESTBENCH FOR THE KEYPAD SCANNER MODULE
`timescale 1ns/1ps 
module tb_KeypadScanner; 
    reg [3:0] R; 
    reg [2:0] C; 
    wire [3:0] N; 
    wire V; 
     
    KeypadScanner uut (.R(R), .C(C), .N(N), .V(V)); 
     
    initial begin 
        $dumpfile("dump.vcd"); 
        $dumpvars(0, tb_KeypadScanner); 
        $monitor("Time=%0t, R=%4b, C=%3b, N=%4b, V=%b", $time, R, C, N, V); 
         
        R = 4'b0010; C = 3'b010; #10; 
        R = 4'b1000; C = 3'b010; #10; 
        R = 4'b1000; C = 3'b100; #10; 
        R = 4'b0000; C = 3'b000; #10; 
        R = 4'b0001; C = 3'b011; #10; 
  $finish; 
    end  
endmodule 
