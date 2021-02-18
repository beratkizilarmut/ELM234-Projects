/* tb_lab7_g41_p2.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Basit hafıza testbenchi */
`timescale 1ns/1ps
module tb_lab7_g41_p2();
    logic clk, reset;
    logic we;
    logic [4:0] waddr;
    logic [31:0] wbdata;
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    lab7_g41_p2 dut0(.clk(clk), .reset(reset), .we(we), .waddr(waddr), .wbdata(wbdata), .rs1(rs1), .rs2(rs2), .rs1_data(rs1_data), .rs2_data(rs2_data));
    always begin
        clk <= 0; #5; clk <= 1; #5;
    end
    initial
    begin
        we = 1; reset = 0;
        waddr = 5'b00000; wbdata = 32'd1; #10;
        waddr = 5'b00001; wbdata = 32'd2; #10;
        waddr = 5'b00010; wbdata = 32'd3; #10;
        waddr = 5'b00011; wbdata = 32'd4; #10;
        waddr = 5'b00100; wbdata = 32'd5; #10;
        waddr = 5'b00101; wbdata = 32'd6; #10;
        waddr = 5'b00110; wbdata = 32'd7; #10;
        waddr = 5'b00111; wbdata = 32'd8; #10;
        we = 0; reset = 0; wbdata = 32'b0;
        rs1 = 5'b00000; # 10;
        rs2 = 5'b00001; # 10;
        rs1 = 5'b00010; # 10;
        rs2 = 5'b00011; # 10;
        rs1 = 5'b00100; # 10;
        rs2 = 5'b00101; # 10;
        rs1 = 5'b00110; # 10;
        rs2 = 5'b00111; # 100;
        $stop;
    end
endmodule
