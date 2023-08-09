`timescale 1ns/1ps
module ls(clk,rst,x,a);
 input wire clk;
 input wire rst;
 input wire x;
 output reg [3:0] a;
 
 always @ (posedge clk)
 begin
        if(rst)
        begin
          a=4'b0000;
        end
        else
        a={a[2:0],x};
        
            
    end


    
endmodule