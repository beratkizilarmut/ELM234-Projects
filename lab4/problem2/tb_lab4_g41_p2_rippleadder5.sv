`timescale 1ns/1ps

module tb_lab4_g41_p2_rippleadder5();

    logic [4:0] a, b, s;
    logic cin, cout;

    lab4_g41_p2_rippleadder5 adder5(.a(a), .b(b), .s(s), .cin(cin), .cout(cout));

    initial begin
    cin = 0; #10;
	a = 5'b00001; b = 5'b00001; #10;
	a = 5'b00010; b = 5'b00001; #10;
	a = 5'b00100; b = 5'b00001; #10;
	a = 5'b00100; b = 5'b00011; #10;
	a = 5'b00101; b = 5'b00011; #10;
	a = 5'b00101; b = 5'b00111; #10;
	a = 5'b00111; b = 5'b00111; #10;
	a = 5'b01101; b = 5'b00011; #10;
	a = 5'b01101; b = 5'b01011; #10;
	a = 5'b00101; b = 5'b00011; #10;
	a = 5'b01101; b = 5'b00001; #10;
	a = 5'b00111; b = 5'b11011; #10;
	a = 5'b00001; b = 5'b01011; #10;
	a = 5'b00001; b = 5'b00011; #10;
	a = 5'b10100; b = 5'b10011; #10;
	a = 5'b10101; b = 5'b10011; #10;    $stop;
    end
endmodule
