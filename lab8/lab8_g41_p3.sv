/* lab8_g41_p3.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Execute Unit */
module lab8_g41_p3 (
    input logic [31:0] rs1_data, rs2_data,
    input logic [31:0] imm,
    input logic [6:0] opcode,
    input logic [3:0] func, // alu veya branch ops
    output logic [31:0] sonuc, // duruma gore ya rd datası ya yeni pc adresi
    output logic pc_update, // branch basarili, pc yi güncelle
    output logic we, // rd yi güncelle
    output logic hata
);

always_comb
begin
    case(opcode)
        7'b0000001:
        begin
            if(func == 4'b0000) // ADD
            begin
                sonuc = rs1_data + rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b1000) // SUB
            begin
                sonuc = rs1_data - rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0111) // AND
            begin
                sonuc = rs1_data & rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0110) // OR
            begin
                sonuc = rs1_data | rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0100) // EOR
            begin
                sonuc = rs1_data ^ rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0001) // LSL
            begin
                sonuc = rs1_data << rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0101) // LSR
            begin
                sonuc = rs1_data >> rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b1101) // ASR
            begin
                sonuc = $signed(rs1_data) >>> rs2_data;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            begin
                sonuc = 32'b0;
                hata = 1;
                pc_update = 0;
                we = 0;
            end
        end
        7'b0000011:
        begin
            if(func == 4'b0000) // ADDI
            begin
                sonuc = rs1_data + imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0111) // ANDI
            begin
                sonuc = rs1_data & imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0110) // ORI
            begin
                sonuc = rs1_data | imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0100) // EORI
            begin
                sonuc = rs1_data ^ imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0001) // LSLI
            begin
                sonuc = rs1_data << imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            if(func == 4'b0101) // LSRI
            begin
                sonuc = rs1_data >> imm;
                hata = 0;
                pc_update = 0;
                we = 1;
            end
            else
            begin
                sonuc = 32'b0;
                hata = 1;
                pc_update = 0;
                we = 0;
            end
        end
        7'b0000111: //MOV
        begin
            sonuc = imm;
            hata = 0;
            pc_update = 0;
            we = 1;
        end
        7'b0001111:
        begin
            if(func == 4'b0011) // B
            begin
                sonuc = imm;
                hata = 0;
                pc_update = 1;
                we = 0;
            end
            else
            if(func == 4'b0000) // BEQ
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if(rs1_data == rs2_data)
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            if(func == 4'b0001) // BNE
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if(rs1_data != rs2_data)
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            if(func == 4'b0100) // BLT
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if($signed(rs1_data) < $signed(rs2_data))
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            if(func == 4'b0101) // BGE
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if($signed(rs1_data) >= $signed(rs2_data))
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            if(func == 4'b0110) // BLTU
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if($unsigned(rs1_data) < $unsigned(rs2_data))
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            if(func == 4'b0111) // BGEU
            begin
                sonuc = imm;
                hata = 0;
                we = 0;
                if($unsigned(rs1_data) >= $unsigned(rs2_data))
                begin
                    pc_update = 1;
                end
                else
                begin
                    pc_update = 0;
                end
            end
            else
            begin
                sonuc = 32'b0;
                hata = 1;
                pc_update = 0;
                we = 0;
            end
        end
        default:
        begin
            sonuc = 32'b0;
            hata = 1;
            pc_update = 0;
            we = 0;
        end
    endcase
end
endmodule
