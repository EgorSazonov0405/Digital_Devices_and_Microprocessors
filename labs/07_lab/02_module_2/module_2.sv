// RAM 4 слова по 3 бита
module lab72 (
    input logic clk ,
    input logic we ,
    input logic [1 : 0] address,
    input logic [2 : 0] din ,
    output logic [2 : 0] dout
)

    logic [2:0] memory [0:3];

    initial begin
        memory[0] = 3'b000;
        memory[1] = 3'b000;
        memory[2] = 3'b000;
        memory[3] = 3'b000;
    end
    
    // read_first
    always_ff @(posedge clk) begin
        if (we)
            memory[address] <= din;
    end
    
    assign dout = memory[address];

endmodule