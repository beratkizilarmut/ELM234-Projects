`timescale 1ns/1ps
module tb_lab5_g41_p1();
    logic clk, reset, en;
    logic [4:0] psc;
    logic tick;
    lab5_g41_p1 c1(.clk(clk), .reset(reset), .en(en), .psc(psc), .tick(tick));
    always
    begin
        clk = 0; #5; clk = 1; #5;
    end

    initial
    begin
        en = 0; reset = 0; #20;
        reset = 1; #20; en = 1;
    end

    initial
    begin
        psc <= 5'h1;
        #500;
        psc <= 5'ha;
        #500;
        $stop;
    end
endmodule