`timescale 1ns/1ps
module rs_tb();
  reg clk_tb;
  reg rst_tb;
  reg x_tb;
  wire [3:0] a_tb;
 initial
        begin
            clk_tb = 1;
            x_tb = 1;
            rst_tb =1;
            #10;
            rst_tb = 0;
            x_tb = 1;
            #10;
            x_tb = 0;
            #10;
            x_tb = 0;
            #10;
            x_tb = 0;
            #10;

            $finish;
         end

    always
        begin
            #5 clk_tb = ~clk_tb;
        end

    rs u_rs0
    (.clk(clk_tb),
   .rst(rst_tb),
   .x(x_tb),
   .a(a_tb));

   initial
   begin
    $dumpfile("rs.vcd");
    $dumpvars(0,rs_tb);
    #1000;
    $finish();
   end
    
endmodule