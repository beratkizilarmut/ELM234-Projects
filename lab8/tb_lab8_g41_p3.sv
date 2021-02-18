/* tb_lab8_g41_p3.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Execute Unit Testbench */
`timescale 1ns/1ps

module tb_lab8_g41_p3();
logic [31:0] rs1_data, rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic [31:0] sonuc;
logic pc_update;
logic we;
logic hata;
lab8_g41_p3 alu0(.rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .opcode(opcode), .func(func), .sonuc(sonuc), .pc_update(pc_update), .we(we), .hata(hata));

initial
begin
    rs1_data = 32'd4; rs2_data = 32'd8; imm = 32'd2;
    opcode = 7'b0000001;
    func = 4'b0000; #10;
    func = 4'b1000; #10;
    func = 4'b0111; #10;
    func = 4'b0110; #10;
    func = 4'b0100; #10;
    func = 4'b0001; #10;
    func = 4'b0101; #10;
    func = 4'b1101; #10;

    opcode = 7'b0000011;
    func = 4'b0000; #10;
    func = 4'b0111; #10;
    func = 4'b0110; #10;
    func = 4'b0100; #10;
    func = 4'b0001; #10;
    func = 4'b0101; #10;

    opcode = 7'b0000111;
    #10;

    opcode = 7'b0001111;
    func = 4'b0011; #10;
    func = 4'b0000; #10;
    func = 4'b0001; #10;
    func = 4'b0100; #10;
    func = 4'b0101; #10;
    func = 4'b0110; #10;
    func = 4'b0111; #10;
    $stop;
end
endmodule
