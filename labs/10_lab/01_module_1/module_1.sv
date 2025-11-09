module lab101 (
    input  logic        clk,
    input  logic [15:0] din1,
    output logic [31:0] dout
);

    // задержка на два такта
    logic [15:0] d1, d2;
    always_ff @(posedge clk) begin
        d1 <= din1;
        d2 <= d1;
    end

    always_ff @(posedge clk) begin
        logic sign;
        logic [15:0] abs_val;
        logic [7:0] exponent;
        logic [22:0] mantissa;

        // Обработка нуля
        if (d2 == 16'd0) begin
            dout <= 32'd0; // положительный ноль IEEE754
        end else begin
            // Определяем знак и модуль
            sign = d2[15];
            abs_val = sign ? (~d2 + 1'b1) : d2;

            // Определяем позицию старшего установленного бита (MSB)
            // с помощью каскада тернарных операторов
            logic [4:0] shift_pos;
            shift_pos =
                abs_val[15] ? 15 :
                abs_val[14] ? 14 :
                abs_val[13] ? 13 :
                abs_val[12] ? 12 :
                abs_val[11] ? 11 :
                abs_val[10] ? 10 :
                abs_val[9]  ? 9  :
                abs_val[8]  ? 8  :
                abs_val[7]  ? 7  :
                abs_val[6]  ? 6  :
                abs_val[5]  ? 5  :
                abs_val[4]  ? 4  :
                abs_val[3]  ? 3  :
                abs_val[2]  ? 2  :
                abs_val[1]  ? 1  : 0;

            // Вычисляем экспоненту: смещение (bias=127) + позиция старшего бита
            exponent = shift_pos + 8'd127;

            // Формируем мантиссу — нормализуем число
            mantissa = (abs_val << (23 - shift_pos)) & 23'h7FFFFF;

            // Собираем выход в формате IEEE754
            dout <= {sign, exponent, mantissa};
        end
    end
endmodule
