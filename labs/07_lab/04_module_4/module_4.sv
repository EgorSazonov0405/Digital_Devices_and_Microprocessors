// RAM 16 слов по 32 бита
module lab74 #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 4
)(
    input logic clk,
    input logic we,
    input logic [ADDR_WIDTH-1:0] address,
    input logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [DATA_WIDTH-1:0] my_ram [0:2**ADDR_WIDTH-1];

    initial begin
        for (int i = 0; i < 2**ADDR_WIDTH; i++)
            my_ram[i] = 0;
    end
    
    // read_first
    always_ff @(posedge clk) begin
        if (we) begin
            my_ram[address] <= din;
        end
        dout <= my_ram[address];
    end

endmodule