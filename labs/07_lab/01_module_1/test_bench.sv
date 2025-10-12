`timescale 1ns / 1ps

module test_lab71();
    logic clk;
    logic srst;
    logic [7:0] dout;
    
    lab71 dut (
        .clk(clk),
        .srst(srst),
        .dout(dout)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        srst = 1;
        #20;
        srst = 0;
        #320; // Два периода (32 такта)
        $stop;
    end
    
endmodule