`timescale 1ns/1ps
module tb_lab101;
    logic clk;
    logic [15:0] din1;
    logic [31:0] dout;

    lab101 uut (
        .clk(clk), 
        .din1(din1), 
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        din1 = 0;   
        #10;
        din1 = 16'd1; // 1
        #10;
        din1 = 16'd5; // 5
        #10;
        din1 = -16'sd3; // -3
        #10;
        din1 = 16'd255; // 255
        #10;
        din1 = -16'sd1024; // -1024
        #10;
        #50 $finish;
    end

endmodule
