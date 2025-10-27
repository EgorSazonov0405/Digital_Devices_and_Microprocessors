module lab93 (
    input logic clk,
    input logic [7:0] x1,  // (1,8,4) - знаковое, 8 бит, 4 дробных бита
    input logic [7:0] x2,  // (1,8,4) - знаковое, 8 бит, 4 дробных бита
    output logic [7:0] dout // (1,8,4) - результат с насыщением
);

    logic signed [15:0] result;
    logic signed [15:0] result_rounded;
    logic signed [7:0] saturated_result; // Результат после насыщения

    always_comb begin
        // 1. Умножение с полной точностью
        result = $signed(x1) * $signed(x2); // Результат в формате (1,16,8)
        
        // 2. Округление с учетом старшего отбрасываемого бита
        // Добавляем 2^(F-1) = 8 перед сдвигом для округления до ближайшего
        result_rounded = (result + 8) >>> 4;
        
        // 3. Насыщение
        if (result_rounded > 127) begin
            saturated_result = 127; // Максимальное положительное
        end else if (result_rounded < -128) begin
            saturated_result = -128; // Минимальное отрицательное
        end else begin
            saturated_result = result_rounded[7:0]; // Без насыщения
        end
    end

    always_ff @(posedge clk) begin
        dout <= saturated_result;
    end

endmodule