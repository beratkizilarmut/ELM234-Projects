module lab4_g41_p3_alu(
	input logic [31:0] a,b,
	input logic [3:0] op,
	output logic  [31:0] s,
	output logic n,z,v,c,hata);	
	logic [31:0] twoscompb;
	logic [32:0] carrys;
	always_comb
	begin 
		hata = 1'b0;n = 1'b0;z = 1'b0;v = 1'b0;c = 1'b0;twoscompb = 32'b0;carrys = 33'b0;
		if (op==4'b0000) //addition
			begin
			carrys = a + b; 
			s=carrys[31:0];
				c = (carrys[32]) ? 1'b1 : 1'b0;
				v = ((a[31] ~^ b[31])) ? ( (s[31] ^ a[31]) ? 1'b1 : 1'b0) : 1'b0;
			end
			
		else if (op==4'b1000) //subtraction
			begin
			carrys = a - b;
				s = carrys[31:0];
				c = (carrys[32]) ? 1'b0 : 1'b1;	
				twoscompb = (~b) + 32'd1;
				v = ((a[31] ~^ twoscompb[31])) ? ( (s[31] ^ a[31]) ? 1'b1 : 1'b0) : 1'b0;
			end
			
		else if (op==4'b0001) //shiftleftlogic
			begin
			carrys = a << b[4:0];	
			c = carrys[32];
			s = carrys[31:0];
			end
			
		else if (op==4'b0010) //signedcomp
			s = ($signed(a) > $signed(b)) ? 32'd1:32'd0;	
			
		else if (op==4'b0011) //unsignedcomp
			s = (a > b) ? 32'd1:32'd0;	
			
		else if (op==4'b0100) //xorZ
			s = a ^ b;	
			
		else if (op==4'b0101) //shiftrightlogic
			begin
			if(|b[4:0])
				begin
			s = a >>> (b[4:0]-5'd1);
			c = s[0];
			s = s >>> (5'd1);
				end
			else
				begin
				s=a;
				c=1'd0;
				end
			end
			
		else if (op==4'b1101) //shiftrightarithmetic
			begin
			if(|b[4:0])
			begin
			s = $signed(a) >>> (b[4:0]-5'd1);
			c = s[0];
			s = $signed(s) >>> (5'd1);
			end
			else
				begin
				s=a;
				c=1'd0;
				end
			end
			
		else if (op==4'b0110) //or
			s = a | b;			
			
		else if (op==4'b0111) //and
			s = a & b;		
			
		else 
			begin
			hata = 1'b1;
			s = 32'bz;
			end
		if(hata)
			begin
			n = 1'b0;
			z = 1'b0;
			end
		else 
			begin
			n = s[31];
			z = ~|s;
			end
	end
endmodule
		
			
		