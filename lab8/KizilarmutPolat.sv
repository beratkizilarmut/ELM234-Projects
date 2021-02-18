/* KizilarmutPolat.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Single Cycle Processor */
module KizilarmutPolat(
    input logic clk, reset,
    input logic [31:0] komut,
    output logic [31:0] pc,
    output logic hata
);
logic we;
logic pc_update;
logic [31:0] rs1_data, rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic [31:0] sonuc;
logic hata1, hata2;
assign hata = hata1 | hata2;
lab8_g41_p1 fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(sonuc));
lab8_g41_p2 decode0(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .func(func), .rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .we(we), .rd_data(sonuc), .hata(hata1));
lab8_g41_p3 alu0(.rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .opcode(opcode), .func(func), .sonuc(sonuc), .pc_update(pc_update), .we(we), .hata(hata2));
endmodule
