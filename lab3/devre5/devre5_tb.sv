`timescale  1ns/1ps
module devre5_tb ();
	logic [7:0]a,b;
	logic s;
	logic [7:0] y;
	devre5 dut0(a,b,s,y);
	initial begin
       	a = 8'b10001010; b = 8'b11000011;
	s=0; #10;
	s=1; #10;
	$stop;
	end
endmodule
