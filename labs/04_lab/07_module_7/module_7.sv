module lab47 (
    input logic [7 : 0] x,
    output logic [9 : 0] y
);
logic [15:0] tmp;
assign tmp = (x * 5 * 4) / 7; // Умножаем на 4 для получения 2 дробных битов
assign y = tmp[9:0]; // Берем младшие 10 бит
endmodule