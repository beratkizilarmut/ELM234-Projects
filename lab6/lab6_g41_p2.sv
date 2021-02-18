/* lab6_g41_p2.sv
 * Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
 * Notlar: Sıralayıcı */
module lab6_g41_p2 (
input logic clk, reset, en,
input logic [4:0] d,
input logic baslat,
output logic y,
output logic meşgul );
typedef enum {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
statetype state, nextstate;
always_ff @(posedge clk)
begin
    if(!reset)
        state <= S0;
    else
    if(en)
        state <= nextstate;
end
always_comb
begin
    case(state)
    S0:
    begin
        y = 1;
        mesgul = 0;
        if(baslat)
            nextstate = S1;
        else
            nextstate = S0;
    end
    S1:
    begin
      mesgul = 1;
        nextstate = S2;
        y = 0;
    end
S2:
    begin
        mesgul = 1;
        nextstate = S3;
        y = d[0];
    end
    S3:
    begin
        mesgul = 1;
        nextstate = S4;
        y = d[1];
    end
    S4:
    begin
        mesgul = 1;
        nextstate = S5;
        y = d[2];
    end
    S5:
    begin
        mesgul = 1;
        nextstate = S6;
        y = d[3];
    end
    S6:
    begin
        mesgul = 1;
        nextstate = S7;
        y = d[4];
    end
    S7:
    begin
        mesgul = 1;
        nextstate = S0;
        y = 1;
    end
    default: nextstate = S0;
    endcase
end
endmodule
