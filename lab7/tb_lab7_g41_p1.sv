/* tb_lab7_g41_p1.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Komut ayırıcı testbenchi */
`timescale 1ns/1ps
module tb_lab7_g41_p1();
logic clk, reset;
logic [31:0] komut;
logic [6:0] opcode;
logic [3:0] aluop;
logic [4:0] rs1;
logic [4:0] rs2;
logic [31:0] rs1_data;
logic [31:0] rs2_data;
logic [4:0] rd;
logic [31:0] imm;
logic hata;
lab7_g41_p1 dut1(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .aluop(aluop), .rs1(rs1), .rs2(rs2), .rs1_data(rs1_data), .rs2_data(rs2_data), .rd(rd), .imm(imm), .hata(hata));
initial 
begin
    /////////////////R///////////////////////
    komut = 32'b0010000_10100_00110_001_10011_0000001; #10;
    komut = 32'b0000000_01011_11001_001_10111_0000001; #10;
    komut = 32'b0000000_10010_10001_101_11111_0000001; #10;
    komut = 32'b0010000_01110_10101_100_01100_0000001; #10;
    /////////////////I///////////////////////
    komut = 32'b001000010100_00110_001_10011_0000011; #10;
    komut = 32'b000000001011_11001_001_10111_0000011; #10;
    komut = 32'b000000010010_10001_101_11111_0000011; #10;
    komut = 32'b001000001110_10101_100_01100_0000011; #10;
    /////////////////U///////////////////////
    komut = 32'b00100001010000110001_10011_0000111; #10;
    komut = 32'b00000000101111001001_10111_0000111; #10;
    komut = 32'b00000001001010001101_11111_0000111; #10;
    komut = 32'b00100000111010101100_01100_0000111; #10;
    /////////////////B///////////////////////
    komut = 32'b0010000_10100_00110_001_10011_0001111; #10;
    komut = 32'b0000000_01011_11001_001_10111_0001111; #10;
    komut = 32'b0000000_10010_10001_101_11111_0001111; #10;
    komut = 32'b0010000_01110_10101_100_01100_0001111; #10;
    /////////////////HATA////////////////////
    komut = 32'b0010000_10100_00110_001_10011_0010001; #10;
    komut = 32'b0000000_01011_11001_001_10111_0100001; #10;
    komut = 32'b0000000_10010_10001_101_11111_0001001; #10;
    komut = 32'b0010000_01110_10101_100_01100_0101101; #10;
    $stop;
end
endmodule
