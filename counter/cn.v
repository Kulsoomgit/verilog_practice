`timescale 1ns/1ps
module cn(clk,rst,a);
 input wire clk;
 input wire rst;
 output reg [3:0] a;

 always @(posedge clk ) begin
    if(rst)
        begin
          a<=4'b0000;
        end
    else
        a=a+1'b1;
 end    
endmodule