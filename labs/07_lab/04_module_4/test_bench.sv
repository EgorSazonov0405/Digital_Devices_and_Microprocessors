module tb_lab74();
    logic clk;
    logic we;
    logic [3:0] address;
    logic [31:0] din;
    logic [31:0] dout;
    
    lab74 dut (
        .clk(clk),
        .we(we),
        .address(address),
        .dout(dout),
        .din(din)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    logic [12:0] data_count = 0;
    logic [3:0] addr_count = 0;
    logic [5:0] time_count = 0;
    
    initial begin
        we = 0;
        #300;
        
        for (int i = 0; i < 50; i++) begin
            @(posedge clk);
            time_count++;
            
            if (time_count > 20 && time_count <= 36)
                we = 1;
            else
                we = 0;
        end
        
        $stop;
    end
    
    always_ff @(posedge clk) begin
        if (data_count < 8192 - 8)
            data_count <= data_count + 8;
        else
            data_count <= 0;
        
        addr_count <= addr_count + 1;
    end
    
    assign din = data_count;
    assign address = addr_count;

endmodule