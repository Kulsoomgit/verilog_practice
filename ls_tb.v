`timescale 1ns/1ps
module ls_tb();
  reg clk_tb;
  reg rst_tb;
  reg x_tb;
  wire [3:0] a_tb;
 initial
        begin
            clk_tb=0;rst_tb=1;
            #10;
            rst_tb=0;
            //#10;
            x_tb=1;
            $display("a_tb=%d",a_tb);
            #20 x_tb=0;
            $display("a_tb=%d",a_tb);
         end

    always
        begin
            #5 clk_tb = ~clk_tb;
        end

    ls u_ls0
    (.clk(clk_tb),
   .rst(rst_tb),
   .x(x_tb),
   .a(a_tb));

   initial
   begin
    $dumpfile("ls.vcd");
    $dumpvars(0,ls_tb);
    #1000;
    $finish();
   end
    
endmodule