/* tb_lab6_g41_p1.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Pattern Yakalayıcı testbenchi */
`timescale 1ns/1ps
module tb_lab6_g41_p1();
logic a, clk, y;
lab6_g41_p1 dut1(.a(a), .clk(clk), .y(y));
always
 begin
    clk = 1; #5;
    clk = 0; #5;
 end
initial
 begin
    a = 0; #16;
    a = 1; #13;
    a = 0; #40;
    a = 1; #44;
    a = 0; #17;
    $stop;
 end
endmodule
