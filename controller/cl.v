module cl (zero,phase,opcode,sel,rd,id_ir,inc_pc,halt,id_pc,data_e,id_ac,wr);
    input wire zero;
    input wire [2:0] phase;
    input wire [2:0] opcode;

    output reg sel;
    output reg rd;
    output reg id_ir;
    output reg inc_pc;
    output reg halt;
    output reg id_pc;
    output reg data_e;
    output reg id_ac;
    output reg wr;

    reg H=0, A=0, Z=0, S=0, J=0;

    always @(opcode) begin
        H=(opcode==3'b000)?1:0;
        Z=(opcode==3'b001)?1:0;
        A=(opcode==3'b010 | opcode==3'b011 | opcode==3'b100 | opcode==3'b101 )?1:0;   
        S=(opcode==3'b110 && zero==1)?1:0;
        J=(opcode==3'b111)?1:0;
    end

    always @(phase) begin
        
        if (phase == 3'b000) begin
            sel = 1;
            rd = 0; 
            id_ir = 0; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b001) begin
            sel = 1; 
            rd = 1; 
            id_ir = 0; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b010) begin
            sel = 1; 
            rd = 1; 
            id_ir = 1; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b011) begin
            sel = 1; 
            rd = 1; 
            id_ir = 1; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b100) begin
            sel = 0; 
            rd = 0; 
            id_ir = 0; 
            inc_pc = 1; 
            halt = H; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b101) begin
            sel = 0; 
            rd = A; 
            id_ir = 0; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = 0; 
            data_e = 0; 
            id_ac = 0; 
            wr = 0;
        end
        else if (phase == 3'b110) begin
            sel = 0; 
            rd = A; 
            id_ir = 0; 
            inc_pc = Z; 
            halt = 0; 
            id_pc = J; 
            data_e = S; 
            id_ac = 0; 
            wr = 0;
        end
         else begin
            sel = 0; 
            rd = A; 
            id_ir = 0; 
            inc_pc = 0; 
            halt = 0; 
            id_pc = J; 
            data_e = S; 
            id_ac = A; 
            wr = S;
        end
    end

endmodule