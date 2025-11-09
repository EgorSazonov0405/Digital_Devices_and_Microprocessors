module tb_lab82();
    logic clk;
    logic srst;
    logic btn;
    logic [2:0] x1, x2;
    logic [7:0] y;
    
    lab82 dut (
        .clk(clk),
        .srst(srst),
        .btn(btn),
        .x1(x1),
        .x2(x2),
        .y(y)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        srst = 1;
        btn = 0;
        x1 = 3'b101;
        x2 = 3'b011;
        #20;
        srst = 0;
        
        #100; 
        btn = 1; 
        #10; 
        btn = 0; // WAIT -> SUM
        
        #100; 
        btn = 1; 
        #10; 
        btn = 0; // SUM -> MUL
        
        #100; 
        btn = 1; 
        #10; 
        btn = 0; // MUL -> GRAY
        
        #300;
        $stop;
    end
endmodule