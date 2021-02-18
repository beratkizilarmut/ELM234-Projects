`timescale  1ns/1ps
module devre4_tb ();
	logic [7:0]a;
	logic [3:0]y;
	devre4 dut0(a,y);
	initial begin
       		a = 8'b00000000; #10;
       		a = 8'b10000000; #10;
       		a = 8'b00000001; #10;
       		a = 8'b10000001; #10;
       		a = 8'b01000000; #10;
       		a = 8'b00000110; #10;
       		a = 8'b00100000; #10;
       		a = 8'b10000100; #10;
       		a = 8'b00000011; #10;
       		a = 8'b00010100; #10;
       		a = 8'b01001000; #10;
       		a = 8'b00110000; #10;
       		a = 8'b11000000; #10;
       		a = 8'b00100010; #10;
       		a = 8'b01000101; #10;
       		a = 8'b11100001; #10;

	$stop;
	end
endmodule
