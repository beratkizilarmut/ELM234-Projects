`timescale  1ns/1ps
module mux4_tb ();
	logic [7:0]a,b,c,d;
	logic [1:0]s;
	logic [7:0] y;
	mux4 dut0(a,b,c,d,s,y);
	initial begin
       	a = 8'b10001010; b = 8'b11000011;
	c = 8'b00110101; d = 8'b00110000;
	s[0]=0;s[1]=0;  #10;
	s[0]=1;         #10;
	s[0]=0;s[1]=1;	#10;
	s[0]=1;		#10;
	$stop;
	end
endmodule