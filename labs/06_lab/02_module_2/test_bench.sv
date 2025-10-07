`timescale 1ns / 1ps

module test_lab62();
    logic clk;
    logic dout;

    lab62 dut (
        .clk(clk),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #1000;
        $finish;
    end
endmodule