module lab101 (
    input  logic        clk,
    input  logic [15:0] din1,
    output logic [31:0] dout
);
    // задержка 2 такта
    logic [15:0] d1, d2;
    always_ff @(posedge clk) begin
        d1 <= din1;
        d2 <= d1;
    end

    always_ff @(posedge clk) begin
        logic sign;
        logic [15:0] abs_val;
        integer shift;
        logic [7:0] exponent;
        logic [22:0] mantissa;
        logic [31:0] result;

        if (d2 == 0) begin
            dout <= 32'b0;  // +0 по IEEE754
        end else begin
            // определяем знак
            sign = d2[15];
            abs_val = sign ? (~d2 + 1'b1) : d2;

            // ищем позицию MSB
            shift = 0;
            for (int i = 15; i >= 0; i--) begin
                if (abs_val[i]) begin
                    shift = i;
                    break;
                end
            end

            // вычисляем порядок (смещение +127)
            exponent = shift + 127;

            // формируем мантиссу: сдвигаем число так, чтобы MSB стал на 23-й позиции
            mantissa = (abs_val << (23 - shift)) & 23'h7FFFFF;

            // собираем IEEE754 число
            result = {sign, exponent, mantissa};
            dout <= result;
        end
    end
endmodule
