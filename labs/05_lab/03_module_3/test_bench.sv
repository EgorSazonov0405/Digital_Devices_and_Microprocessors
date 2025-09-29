`timescale 1ns / 1ps

module test_lab53();
    logic clk;
    logic [7:0] din;
    logic [7:0] dout;

    lab53 dut (
        .clk(clk),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        din = 8'h00;
        #10;
        din = 8'hA5;
        #10;
        din = 8'h3C;
        #10;
        din = 8'hF0;
        #10;
        $finish;    
    end

endmodule