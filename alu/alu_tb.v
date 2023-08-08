`timescale 1ns/1ps
module alu_tb ();
 reg [7:0] a_tb;
 reg [7:0] b_tb;
 reg [2:0] op_tb;
 wire [7:0] res_tb;

 initial begin
    a_tb=8'b00000001;b_tb=8'b00000011;op_tb=3'b000;
    $display("res_tb=%d",res_tb);
    #1;
    a_tb=8'b00000100;b_tb=8'b00000001;op_tb=3'b001;
    $display("res_tb=%d",res_tb);
    #1;
 end
 alu u_alu
 (.a (a_tb),
 .b (b_tb),
 .op (op_tb),
 .res (res_tb)
 );
 initial begin
   $dumpfile ("alu.vcd");
   $dumpvars (0,alu_tb);
 end
    
endmodule