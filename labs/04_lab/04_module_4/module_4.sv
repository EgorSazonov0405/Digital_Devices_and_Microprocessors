// Умножитель двух неотрицательных двухразрядных чисел - произведение максимум 4
module lab41 (
    input logic [1 : 0] x1,
    input logic [1 : 0] x2,
    output logic [3 : 0] an,
    output logic [6 : 0] y
);

logic [3:0] result;

assign result = x1 * x2;

assign an = 4'b1110;

always_comb begin
    case (result)
        4'd0: y = ~7'b0111111; // 0
        4'd1: y = ~7'b0000110; // 1
        4'd2: y = ~7'b1011011; // 2
        4'd3: y = ~7'b1001111; // 3
        4'd4: y = ~7'b1100110; // 4
        default: y = ~7'b1111001; // E - ошибка
    endcase
end

endmodule