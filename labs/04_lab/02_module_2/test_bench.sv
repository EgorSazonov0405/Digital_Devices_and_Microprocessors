`timescale 1ns / 1ps

module test_bench1();
    logic signed [6:0] x;
    logic signed [7:0] y;
    
    lab42 inst_lab42 (
        .x(x),
        .y(y)
    );
    
    initial begin
        x = 7'b0000001;
        #200;
        x = 7'b1000001;
        #200;
        x = 7'b1111101;
        #200;
        x = 7'b0001111;
        #200;
        x = 7'b1001111;
        #200;
        $stop;
    end
endmodule