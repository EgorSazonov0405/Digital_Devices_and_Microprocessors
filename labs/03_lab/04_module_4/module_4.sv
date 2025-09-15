// **Двухадресный мультиплексор чисел в прямом двоичном коде на семисегментный индикатор

module lab34(
    input logic [3 : 0] din0,
    input logic [3 : 0] din1,
    input logic [3 : 0] din2,
    input logic [3 : 0] din3,
    input logic [1 : 0] addr,
    input logic [3 : 0] an ,
    output logic [6 : 0] dout
);

logic [3:0] selected_data;

always_comb begin
    case (addr)
        2'b00 : selected_data = din0;
        2'b01 : selected_data = din1;
        2'b10 : selected_data = din2;
        2'b11 : selected_data = din3;
        default: selected_data = 4'b0000;
    endcase
end

always_comb begin
    case (selected_data)
        4'b0000 : dout = ~7'b0111111; // 0
        4'b0001 : dout = ~7'b0000110; // 1
        4'b0010 : dout = ~7'b1011011; // 2
        4'b0011 : dout = ~7'b1001111; // 3
        4'b0100 : dout = ~7'b1100110; // 4
        4'b0101 : dout = ~7'b1101101; // 5
        4'b0110 : dout = ~7'b1111101; // 6
        4'b0111 : dout = ~7'b0000111; // 7
        4'b1000 : dout = ~7'b1111111; // 8
        4'b1001 : dout = ~7'b1101111; // 9
        4'b1010 : dout = ~7'b1110111; // A
        4'b1011 : dout = ~7'b1111100; // b
        4'b1100 : dout = ~7'b0111001; // C
        4'b1101 : dout = ~7'b1011110; // d
        4'b1110 : dout = ~7'b1111001; // E
        4'b1111 : dout = ~7'b1110001; // F
        default: dout =  ~7'b1000000; // -
    endcase
end

assign an = 4'b1110;

endmodule