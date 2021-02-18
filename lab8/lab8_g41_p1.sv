/* lab8_g41_p1.sv
* Hazırlayanlar: Berat Kızılarmut, 
                 Ömer Emre Polat
* Notlar: Instruction Fetch Unit*/
module lab8_g41_p1 (
    input logic clk, reset,
    output logic [31:0] pc,
    input logic pc_update,
    input logic [31:0] pc_new
);
always_ff @(posedge clk)
begin
    if(reset)
    begin
        if(pc_update)
        begin
            pc <= pc_new;
        end
        else
        begin
            pc <= pc + 32'd4;
        end
    end
    else
    begin
        pc <= 32'b0;
    end
end
endmodule
