/* tb_KizilarmutPolat.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Single Cycle Processor Testbench */
`timescale 1ns/1ps
module tb_KizilarmutPolat();
logic clk, reset;
logic [31:0] komut;
logic [31:0] pc;
logic hata;
KizilarmutPolat arm0(.clk(clk), .reset(reset), .komut(komut), .pc(pc), .hata(hata));
logic [31:0] prog_memory [0:63]; //program memory for program counter to pull the instructions

assign komut = prog_memory[pc[29:0] >> 2];
always
begin
    clk = 1; #5;
    clk = 0; #5;
end
initial
begin
    $readmemb("C:\\Users\\user\\Desktop\\Lojik\\SystemVerilog\\lab8\\fib20.mem", prog_memory); //loading file
    reset = 0; #3; //resetting
    reset = 1; #2;
    #1100; //runtime
    $stop; //end of runtime
end
endmodule
