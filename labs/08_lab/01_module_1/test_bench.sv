module tb_lab81();
    logic clk;
    logic srst;
    logic info;
    logic [1:0] coded;
    
    lab81 dut (
        .clk(clk),
        .srst(srst),
        .info(info),
        .coded(coded)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        srst = 1;
        info = 0;
        #20;
        srst = 0;

        info = 1; #10;
        info = 1; #10;
        info = 1; #10;
        info = 0; #10;
        info = 1; #10;
        
        #50;
        $stop;
    end
endmodule