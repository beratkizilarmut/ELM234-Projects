module lab4_g41_p4_alu(
	input logic [31:0] a,b,
	input logic [3:0] op,
	output logic  [31:0] s,
	output logic n,z,v,c,hata,
    input logic clk
);
logic [31:0] rega, regb, regs;
logic [3:0] regop;
logic regn, regz, regv, regc, reghata;
lab4_g41_p3_alu alu(.a(rega),.b(regb),.op(regop),.s(regs),.n(regn),.z(regz),.v(regv),.c(regc),.hata(reghata));
always_ff @(posedge clk)
begin
    rega <= a;
    regb <= b; 
    regop <= op;  
    s <= regs;
    n <= regn;
    z <= regz;
    v <= regv;
    c <= regc;
    hata <= reghata;
end
endmodule