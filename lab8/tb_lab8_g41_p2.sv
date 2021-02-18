/* tb_lab8_g41_p2.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Instruction Encode Unit Testhbench */
`timescale 1ns/1ps
module tb_lab8_g41_p2();
    logic clk, reset;
    logic [6:0] opcode;
    logic [3:0] func;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic [31:0] imm;
    logic hata;
    logic we;
    logic [31:0] rd_data;
    logic [31:0] pc; //variables for p1
    logic pc_update;
    logic [31:0] pc_new;
    logic [31:0] prog_memory [0:63]; //program memory for program counter to pull the instructions
    logic [31:0] komut;
    assign komut = prog_memory[pc[29:0] >> 2];
    lab8_g41_p2 decode0(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .func(func), .rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .hata(hata), .we(we), .rd_data(rd_data));
    lab8_g41_p1 fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(pc_new)); //instantiation of p1 so that we can use pc to pull instructions
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
        #110; //runtime
        $stop; //end of runtime
    end
endmodule
