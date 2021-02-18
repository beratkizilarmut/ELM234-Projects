module lab5_g41_p1 (
input logic clk, reset, en,
input logic [4:0] psc,
output tick);
logic count = 5'b0;
always_ff @(posedge clk, negedge reset)
begin
    if(!reset)
    begin
        count <= 5'b0;
    end
    else if(en)
    begin
        count <= count + 1'b1;
    end
end
assign tick = (count == psc);
endmodule