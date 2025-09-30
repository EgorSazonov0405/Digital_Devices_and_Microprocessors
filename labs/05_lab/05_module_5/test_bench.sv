`timescale 1ns / 1ps

module test_lab55();
    logic clk;
    logic srst;
    logic [1:0] coded;

    lab55 dut (
        .clk(clk),
        .srst(srst),
        .coded(coded)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        srst = 1;
        #20;
        srst = 0;
        #200;
        $finish;
    end
    
endmodule