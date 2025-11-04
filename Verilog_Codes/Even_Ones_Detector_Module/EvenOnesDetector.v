// Verilog HDL description for a circuit that keeps on taking 1bit input serially and outputs 1 when the no of 1's in the input stream is even
module EvenOnesDetector(input clk, input rst, input din, output reg out); 
    reg count; 
    always @(posedge clk or posedge rst) begin 
        if (rst) 
            count <= 0;           
        else if (din) 
            count <= ~count;      
    end 
    always @(*)  
        out = ~count;             
endmodule
