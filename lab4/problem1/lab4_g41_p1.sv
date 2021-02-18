module lab4_g41_p1(
	input logic  d,clk,
	output logic latch,reff,feff);
	
	always_latch
	begin 
		if(clk) latch<=d;
	end

	always_ff @(posedge clk)
	begin
		reff<=d;
	end

	always_ff @(negedge clk)
	begin
		feff<=d;
	end
endmodule