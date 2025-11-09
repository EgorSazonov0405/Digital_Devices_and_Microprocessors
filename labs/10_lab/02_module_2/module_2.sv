module lab102 (
    input  logic        clk,
    input  logic [31:0] din1,
    input  logic [31:0] din2,
    output logic [31:0] dout
);
    logic s1, s2;
    logic [7:0] e1, e2, e_res;
    logic [23:0] m1, m2, m_res;
    logic s_res;
    logic [24:0] sum;

    always_ff @(posedge clk) begin
        // разбираем операнды
        s1 = din1[31];
        s2 = din2[31];
        e1 = din1[30:23];
        e2 = din2[30:23];
        m1 = {1'b1, din1[22:0]};
        m2 = {1'b1, din2[22:0]};

        // выравниваем порядки
        if (e1 > e2)
            m2 = m2 >> (e1 - e2);
        else if (e2 > e1)
            m1 = m1 >> (e2 - e1);

        e_res = (e1 > e2) ? e1 : e2;

        // сложение/вычитание
        if (s1 == s2)
            sum = m1 + m2;
        else
            sum = (m1 >= m2) ? (m1 - m2) : (m2 - m1);

        // нормализация
        if (sum[24]) begin
            m_res = sum[24:1];
            e_res = e_res + 1;
        end else begin
            m_res = sum[23:0];
        end

        s_res = (m1 >= m2) ? s1 : s2;

        // формируем результат
        dout <= {s_res, e_res, m_res[22:0]};
    end
endmodule
