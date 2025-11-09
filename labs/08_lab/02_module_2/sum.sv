// Сумматор двух неотрицательных трехразрядных чисел
module sum (
    input logic [2 : 0] x1,
    input logic [2 : 0] x2,
    output logic [3 : 0] y
);

assign y = {1'b0, x1} + {1'b0, x2}; // расширяем разрядность, чтобы избежать переполнения

endmodule