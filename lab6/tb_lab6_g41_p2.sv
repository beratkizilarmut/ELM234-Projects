/* tb_lab6_g41_p2.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Sıralayıcı testbenchi */
`timescale 1ns/1ps

module tb_lab6_g41_p2();

logic clk, baslat, y, mesgul, en, reset;
logic [4:0] d;

lab6_g41_p2 dut1(.clk(clk), .d(d), .baslat(baslat), .y(y), .mesgul(mesgul), .en(en), .reset(reset));

always
begin
    clk = 1; #5;
    clk = 0; #5;
end

initial
begin
    en = 1;
    reset = 1;
    d = 5'b01101;
    baslat = 0; #16;
    baslat = 1; #8;
    baslat = 0; #96;
    en = 0; #20;
    reset = 0; #10;
    reset = 1; en = 1; #10;
    baslat = 1; #10;
    baslat = 0; #10;
    #100;
    $stop;
end
endmodule
