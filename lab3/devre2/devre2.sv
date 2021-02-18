`timescale  1ns/1ps
module devre2(	
	input logic a,b,
	output logic y 
 );
	assign #3 n1 = ~a;
	assign #5 y = n1 & b;
endmodule