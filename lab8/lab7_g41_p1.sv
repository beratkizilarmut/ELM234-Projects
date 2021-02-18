/* lab7_g41_p1.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Komut Ayırıcı */
module lab7_g41_p1 (
input logic clk, reset,
input logic [31:0] komut,
output logic [6:0] opcode,
output logic [3:0] aluop,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [4:0] rd,
output logic [31:0] imm,
output logic hata
);
assign opcode = komut[6:0];
always_comb
begin
    case(opcode)
        /////////////////R///////////////////////
        7'b0000001:
        begin
            aluop = {komut[30], komut[14:12]};
            rs1 = komut[19:15];
            rs2 = komut[24:20];
            rd = komut[11:7];
            imm = 32'd0;
            hata = 1'b0;
        end
        /////////////////I///////////////////////
        7'b0000011:
        begin
            aluop = {1'b0, komut[14:12]};
            rs1 = komut[19:15];
            rs2 = 5'd0;
            rd = komut[11:7];
            imm = {20'd0, komut[31:20]};
            hata = 1'b0;
        end
        /////////////////U///////////////////////
        7'b0000111:
        begin
            aluop = 4'd0;
            rs1 = 5'd0;
            rs2 = 5'd0;
            rd = komut[11:7];
            imm = {12'd0, komut[31:12]};
            hata = 1'b0;
        end
        /////////////////B///////////////////////
        7'b0001111:
        begin
            aluop = {1'b0, komut[14:12]};
            rs1 = komut[19:15];
            rs2 = komut[24:20];
            rd = 5'd0;
            imm = {19'd0, komut[31:25], komut[11:7], 1'b0};
            hata = 1'b0;
        end
        default:
        begin
            hata = 1'b1;
            aluop = 4'd0;
            rs1 = 5'd0;
            rs2 = 5'd0;
            rd = 4'd0;
            imm = 32'd0;
        end
    endcase
end
endmodule
