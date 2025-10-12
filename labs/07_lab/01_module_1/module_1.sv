// Генератор синусоидального колебания на основе ROM (16 слов по 8 битов)
module lab71 (
    input logic clk,
    input logic srst,
    output logic [7:0] dout
);

    logic [3:0] address;
    logic [7:0] rom [0:15];
    
    initial begin
        rom[0] = 8'b00000000;
        rom[1] = 8'b00110000;
        rom[2] = 8'b01011001;
        rom[3] = 8'b01110101;
        rom[4] = 8'b01111111;
        rom[5] = 8'b01110101;
        rom[6] = 8'b01011001;
        rom[7] = 8'b00110000;
        rom[8] = 8'b00000000;
        rom[9] = 8'b11001111;
        rom[10] = 8'b10100110;
        rom[11] = 8'b10001010;
        rom[12] = 8'b10000001;
        rom[13] = 8'b10001010;
        rom[14] = 8'b10100110;
        rom[15] = 8'b11001111;
    end
    
    always_ff @(posedge clk) begin
        if (srst)
            address <= 0;
        else
            address <= address + 1;
    end
    
    assign dout = rom[address];

endmodule