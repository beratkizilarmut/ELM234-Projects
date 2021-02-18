module devre4(	
	input logic [7:0] a,
	output logic [3:0] y 
 );

	assign y = a[7] ? 4'b0001: 
		   a[6] ? 4'b0011: 
	      a[5] ? 4'b0010: 
		   a[4] ? 4'b0110: 
		   a[3] ? 4'b0111: 
		   a[2] ? 4'b0101: 
		   a[1] ? 4'b0100: 
		   a[0] ? 4'b1100: 4'b0000;
endmodule

