`timescale  1ns/1ps
module devre3_tb ();
	logic a,b,c,d;
	logic x;
	devre3 dut0(a,b,c,d,x);
	initial begin
       		a = 0; b = 0; c = 0; d = 0; #10;
        	d = 1; 			    #10;
        	c = 1; d = 0;		    #10;
        	d = 1; 			    #10;
        	b = 1; c = 0; d = 0;        #10;
        	b = 1; d = 1;               #10;
        	b = 1; c = 1; d = 0; 	    #10;
        	b = 1; d = 1; 		    #10;
        	a = 1; b = 0; c = 0; d = 0; #10;
        	b = 0; d = 1; 		    #10;
        	c = 1; d = 0; 		    #10;
        	d = 1; 			    #10;
        	b = 1; c = 0; d = 0; 	    #10;
        	d = 1; 			    #10;
        	c = 1; d = 0; 		    #10;
        	d = 1; 			    #10;
	$stop;
	end
endmodule
