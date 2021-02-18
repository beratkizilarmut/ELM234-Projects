/* lab6_g41_p1.sv
 * Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
 * Notlar: Pattern Yakalayıcı */
module lab6_g41_p1(
    input logic a, clk,
    output logic y );

typedef enum {S0, S1, S2, S3, S4, S5, S6, S7, S8} statetype;
statetype state, nextstate;
always_ff @(posedge clk)
 begin
    state <= nextstate;
 end

always_comb
 begin
    case(state)
        S0:
        begin
            if(a)
                nextstate = S1;
            else
                nextstate = S2;
        end
        S1:
        begin
            if(a)
                nextstate = S3;
            else
                nextstate = S2;
        end
        S2:
        begin
            if(!a)
                nextstate = S4;
            else
                nextstate = S1;
        end
        S3:
        begin
            if(a)
                nextstate = S5;
            else
                nextstate = S2;
        end
        S4:
        begin
            if(!a)
                nextstate = S6;
            else
                nextstate = S1;
        end
S5:
        begin
            if(a)
                nextstate = S7;
            else
                nextstate = S2;
        end
        S6:
        begin
            if(!a)
                nextstate = S8;
            else
                nextstate = S1;
        end
        S7:
        begin
            if(a)
                nextstate = S7;
            else
                nextstate = S2;
        end
        S8:
        begin
            if(!a)
                nextstate = S8;
            else
                nextstate = S1;
        end
        default: nextstate = S0;
    endcase

    case(state)
        S7:
        begin
            y = 1;
        end
        S8:
        begin
            y = 1;
        end
        default: y = 0;
    endcase
 end
endmodule
