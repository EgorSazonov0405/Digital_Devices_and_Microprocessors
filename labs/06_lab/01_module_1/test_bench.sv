`timescale 1ns / 1ps

module test_lab61();
    logic clk;
    logic srst;
    logic [7:0] dout;

    lab61 dut (
        .clk(clk),
        .srst(srst),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        srst = 1;
        #20;
        srst = 0;
        #1000;
        $finish;
    end
endmodule