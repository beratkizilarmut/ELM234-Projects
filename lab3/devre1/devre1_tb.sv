`timescale  1ns/1ps
module devre1_tb ();
	logic a,b;
	logic y;
	devre1 dut0(a,b,y);
	initial begin
		a=0;b=0;#10;
		b=1;    #10;
		a=1;b=0;#10;
		a=1;b=1;#10;
		$stop;
	end
endmodule 