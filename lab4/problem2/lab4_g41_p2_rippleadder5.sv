module lab4_g41_p2_rippleadder5(
	input logic [4:0] a,b,
	input logic cin,
	output logic [4:0] s,
	output logic cout);
	  logic [3:0] n;
lab4_g41_p2_fulladder fa1(a[0],b[0],cin,s[0],n[0]);
lab4_g41_p2_fulladder fa2(a[1],b[1],n[0],s[1],n[1]);
lab4_g41_p2_fulladder fa3(a[2],b[2],n[1],s[2],n[2]);
lab4_g41_p2_fulladder fa4(a[3],b[3],n[2],s[3],n[3]);
lab4_g41_p2_fulladder fa5(a[4],b[4],n[3],s[4],cout);
endmodule