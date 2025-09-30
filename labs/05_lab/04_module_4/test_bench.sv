`timescale 1ns / 1ps

module test_lab54();
    logic clk;
    logic srst;
    logic psp_bit;

    lab54 dut (
        .clk(clk),
        .srst(srst),
        .psp_bit(psp_bit)
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