`timescale  1ns/1ps
module devre3(	
	input logic a,b,c,d,
	output logic x 
 );
	assign #2 n1 = ~b;
	assign #2 n2 = ~c;
	assign #2 n3 = a & n1 & c;
	assign #2 n4 = n2 & d;
 	assign #2 x = n3 | n4;
endmodule