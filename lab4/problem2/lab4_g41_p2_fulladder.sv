module lab4_g41_p2_fulladder(
	input logic a, b, cin,
	output logic  s,cout);
	logic s1,c1,c2;
	lab4_g41_p2_halfadder ha1(a,b,s1,c1);
	lab4_g41_p2_halfadder ha2(s1,cin,s,c2); 
	assign cout = c1 | c2;
endmodule 