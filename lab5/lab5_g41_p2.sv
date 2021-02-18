module lab5_g41_p2 (
    input logic clk, reset, en,
    input logic [ 4:0] psc,
    input logic [15:0] reload,
    output logic [15:0] cnt,
    output logic done
);

    logic tick;
    
    lab5_g41_p1 c1(.clk(clk), .reset(reset), .en(en), .psc(psc), .tick(tick));

    always_ff @(posedge clk, negedge reset)
    begin
        if(!reset)
        begin
            
        end

        else if(en & tick)
        begin
            cnt <= cnt - 1'b1;
        end

        else if(!en)
        begin
            if(reload != 16'b0)
            begin
                cnt <= reload;
            end
        end

        else if(en)
        begin 
            
        end
    end

endmodule