module lab47 (
    input logic [7 : 0] x,
    output logic [9 : 0] y
);
logic [15:0] tmp;
assign tmp = x * 183; // потому что 256*5/7
assign y = tmp[15:6]; // Берем старшие 10 бит
endmodule