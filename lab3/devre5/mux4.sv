module mux4(	
	input logic  [7:0] a,b,c,d,
	input logic  [1:0]s,
	output logic [7:0] y 
 );
	logic [7:0] n1,n2;
	devre5 mux1(a,b,s[0],n1);
	devre5 mux2(c,d,s[0],n2);
	devre5 mux3(n1,n2,s[1],y);	
endmodule