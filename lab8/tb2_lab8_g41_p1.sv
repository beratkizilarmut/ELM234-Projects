/* tb2_lab8_g41_p1.sv
* Hazırlayanlar: Berat Kızılarmut, Ömer Emre Polat
* Notlar: Instruction Fetch Unit Testbench 2 */
`timescale 1ns/1ps
module tb2_lab8_g41_p1();
    logic clk, reset;
    logic [31:0] pc;
    logic pc_update;
    logic [31:0] pc_new;
    logic [31:0] prog_memory [0:63];
    logic [31:0] komut;
    assign komut = prog_memory[pc[29:0] >> 2];
    lab8_g41_p1 fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(pc_new));
    always
    begin
        clk = 1; #5;
        clk = 0; #5;
    end
    initial
    begin
        $readmemb("C:\\Users\\user\\Desktop\\Lojik\\SystemVerilog\\lab8\\fib20.mem", prog_memory); //loading file
        reset = 0; #3; //resetting
        reset = 1; #2;
        #110; //runtime
        $stop; //end of runtime
    end
endmodule
