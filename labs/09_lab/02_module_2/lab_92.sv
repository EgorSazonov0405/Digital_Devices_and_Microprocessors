module lab92 (
    input logic clk,
    input logic [7:0] x1,  // (1,8,4) - знаковое, 8 бит, 4 дробных бита
    input logic [7:0] x2,  // (1,8,4) - знаковое, 8 бит, 4 дробных бита
    output logic [7:0] dout // (1,8,4) - результат умножения
);

    logic signed [15:0] result;        // Полное произведение (1,16,8)
    logic signed [15:0] result_shifted; // Произведение после сдвига (1,16,4)

    always_comb begin
        // 1. Умножение с полной точностью
        result = $signed(x1) * $signed(x2); // Результат в формате (1,16,8)
        
        // 2. Округление отбрасыванием младших 4 битов
        // Арифметический сдвиг вправо на 4 бита для перехода к формату (1,16,4)
        result_shifted = product >>> 4;
    end

    always_ff @(posedge clk) begin
        dout <= result_shifted[7:0];
    end

endmodule