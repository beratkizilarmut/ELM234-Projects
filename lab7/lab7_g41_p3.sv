/* lab7_g41_p3.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Modül birleştirme */
module lab7_g41_p3 (
    input logic clk, reset,
    input logic [31:0] komut,
    output logic [6:0] opcode,
    output logic [3:0] aluop,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data,
    output logic [31:0] imm,
    output logic hata,
    input logic we,
    input logic [31:0] rd_data
);
logic [4:0] rdin, rs1in, rs2in;
logic [31:0] rs1_datain, rs2_datain;
lab7_g41_p1 dut1(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .aluop(aluop), .rs1(rs1in), .rs2(rs2in), .rs1_data(rs1_datain), .rs2_data(rs2_datain), .rd(rdin), .imm(imm), .hata(hata));

lab7_g41_p2 dut2(.clk(clk), .reset(reset), .we(we), .waddr(rdin), .wbdata(rd_data), .rs1(rs1in), .rs2(rs2in), .rs1_data(rs1_data), .rs2_data(rs2_data));
endmodule
