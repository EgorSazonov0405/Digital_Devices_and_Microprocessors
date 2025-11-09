// 4-х разрядный счетчик Грея на основе ROM
module gray (
    input logic clk,
    input logic srst,
    output logic [3:0] dout
);

    logic [26:0] cntr;
    logic [3:0] state_counter;
    logic [3:0] gray_rom [0:15];
    logic cntr26d;
    logic en;

    initial begin
        gray_rom[0] = 4'b0000;
        gray_rom[1] = 4'b0001;
        gray_rom[2] = 4'b0011;
        gray_rom[3] = 4'b0010;
        gray_rom[4] = 4'b0110;
        gray_rom[5] = 4'b0111;
        gray_rom[6] = 4'b0101;
        gray_rom[7] = 4'b0100;
        gray_rom[8] = 4'b1100;
        gray_rom[9] = 4'b1101;
        gray_rom[10] = 4'b1111;
        gray_rom[11] = 4'b1110;
        gray_rom[12] = 4'b1010;
        gray_rom[13] = 4'b1011;
        gray_rom[14] = 4'b1001;
        gray_rom[15] = 4'b1000;
    end
    
    always_ff @(posedge clk) begin
        if (srst)
            cntr <= 0;
        else
            cntr <= cntr + 1;
    end
    
    always_ff @(posedge clk) begin
        if (srst)
            cntr26d <= 0;
        else 
            cntr26d <= cntr[26];    
    end
    
    assign en = cntr[26] & (~cntr26d);
    
    always_ff @(posedge clk or posedge srst) begin
        if (srst)
            state_counter <= 0;
        else if (en)
            state_counter <= state_counter + 1;
    end
    
    assign dout = gray_rom[state_counter];

endmodule