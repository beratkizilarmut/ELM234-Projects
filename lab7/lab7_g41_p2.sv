/* lab7_g41_p2.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Hafıza oluşturma ve okuma */
module lab7_g41_p2 (
input logic clk, reset,
input logic we,
input logic [4:0] waddr,
input logic [31:0] wbdata,
input logic [4:0] rs1,
input logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data
);
logic [31:0] mem [0:31];
always_comb
begin
    rs1_data = mem[rs1];
    rs2_data = mem[rs2];
end

always_ff @(posedge clk)
begin
    if(we)
        mem[waddr] <= wbdata;
end
endmodule
