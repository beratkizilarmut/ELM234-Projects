module devre5(	
	input logic [7:0] a,b,
	input logic 	s,
	output logic [7:0] y 
 );
	logic n1;
	logic [7:0] n2,n3;
	assign n1 = ~s;
	assign n2 = {8{n1}} & a;
	assign n3 = {8{s}} & b;
	assign y = n2 | n3;
endmodule