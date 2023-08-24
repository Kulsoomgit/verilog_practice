`timescale 1ns/1ps
module cl_tb();
    reg zero;
    reg [2:0] phase;
    reg [2:0] opcode;

    wire sel;
    wire rd;
    wire id_ir;
    wire inc_pc;
    wire halt;
    wire id_pc;
    wire data_e;
    wire id_ac;
    wire wr;
  

    initial begin
        zero=0;
        opcode=3'b111;
        phase=3'b000;
        #10;
        
        zero=0;
        opcode=3'b111;
        phase=3'b111;
        #10;

        $finish;
    
    end
    cl u_cl0 (
        .zero(zero),
        .phase(phase),
        .opcode(opcode),
        .sel(sel),
        .rd(rd),
        .id_ir(id_ir),
        .inc_pc(inc_pc),
        .halt(halt),
        .id_pc(id_pc),
        .data_e(data_e),
        .id_ac(id_ac),
        .wr(wr)
    );

    initial begin
        $dumpfile("cl.vcd");
        $dumpvars(0,cl_tb);
    end

endmodule