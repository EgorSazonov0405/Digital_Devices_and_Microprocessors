`timescale 1ns/1ps
module tb_lab102;
    logic clk;
    logic [31:0] din1, din2, dout;

    lab102 uut (
        .clk(clk), 
        .din1(din1), 
        .din2(din2), 
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        din1 = 32'h3F800000; // 1.0
        din2 = 32'h40000000; // 2.0
        #10;
        din1 = 32'hC0000000; // -2.0
        din2 = 32'h40400000; // 3.0
        #10;
        din1 = 32'h3F000000; // 0.5
        din2 = 32'h3F800000; // 1.0
        #10;
        din1 = 32'hBF800000; // -1.0
        din2 = 32'h3F800000; // +1.0
        #10;
        #40 $finish;
    end
    
endmodule
