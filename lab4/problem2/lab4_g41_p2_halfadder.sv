module lab4_g41_p2_halfadder(
	input logic a,b,
	output logic s,cout);
	assign s=a^b;
	assign cout=a&b;
endmodule 