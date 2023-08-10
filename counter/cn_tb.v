`timescale 1ns/1ps
module cn_tb();
  reg clk_tb;
  reg rst_tb;
  wire [3:0] a_tb;
  
  integer i;

  initial
        begin
            clk_tb=0;rst_tb=1;
            #10;
            rst_tb=0;
            $display("a_tb=%d",a_tb);
         end

    always
        begin
            #5 clk_tb = ~clk_tb;
        end

    cn u_cn0
    (.clk(clk_tb),
   .rst(rst_tb),
   .a(a_tb));

   initial
   begin
    $dumpfile("cn.vcd");
    $dumpvars(0,cn_tb);
    #1000;
    $finish();
   end
endmodule