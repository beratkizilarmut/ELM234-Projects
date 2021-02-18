`timescale 1ns/1ps
module tb_lab4_g41_p3_alu();
	logic [31:0] a,b;
	logic [3:0] op;
	logic  [31:0] s;
	logic n,z,v,c,hata;
    lab4_g41_p3_alu alu1(.a(a), .b(b), .op(op), .s(s), .n(n), .z(z), .v(v), .c(c), .hata(hata)); 
    initial begin
        a = 32'd41;
        b = 32'd34;
        op = 4'b0000; #10;
        op = 4'b1000; #10;
        op = 4'b0001; #10;
        op = 4'b0010; #10;
        op = 4'b0011; #10;
        op = 4'b0100; #10;
        op = 4'b0101; #10;
        op = 4'b1101; #10;
        op = 4'b0110; #10;
        op = 4'b0111; #15; 
        op = 4'b1111; #15;
        $stop;
    end
endmodule