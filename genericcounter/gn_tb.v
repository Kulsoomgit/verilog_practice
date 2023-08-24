`timescale 1ns/1ps
module gn_tb();
    reg clk_tb;
    reg rst_tb;
    reg enable_tb;
    reg [4:0]cnt_in_tb;
    reg load_tb;

    wire [4:0]cnt_out_tb;

    gn u_gn0(
        .clk(clk_tb),
        .rst(rst_tb),
        .enable(enable_tb),
        .cnt_in(cnt_in_tb),
        .cnt_out(cnt_out_tb),
        .load(load_tb)
    );

    initial begin
        #20;
        clk_tb =0;
        rst_tb=0;
        load_tb= 1;
        enable_tb=1;
        cnt_in_tb=5'b10101;
        #10;

        rst_tb=0;
        load_tb= 1;
        enable_tb=1;
        cnt_in_tb=5'b01010;
        #10;

        rst_tb=0;
        load_tb= 1;
        enable_tb=1;
        cnt_in_tb=5'b11111;
        #10;

        rst_tb=1;
        load_tb= 1;
        enable_tb=1;
        cnt_in_tb=5'b11111;
        #10;

        rst_tb=0;
        load_tb= 1;
        enable_tb=1;
        cnt_in_tb=5'b11111;
        #10;

        rst_tb=0;
        load_tb= 0;
        enable_tb=1;
        cnt_in_tb=5'b11111;
        #10; 
    end
    initial begin
       $dumpfile("gn.vcd");
       $dumpvars(0,gn_tb);
    end

    always begin
        #5 clk_tb= ~clk_tb;
    end



endmodule