`timescale 1ns / 1ps

module test_lab52();
    logic clk;
    logic srst;
    logic [15:0] dout;
    
    lab52 dut (
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
        #200;
        $finish;
    end
endmodule