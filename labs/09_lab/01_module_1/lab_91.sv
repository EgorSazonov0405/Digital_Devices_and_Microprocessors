module lab91 (
    input logic clk,
    input logic [15:0] x1,  // (1,16,8)
    input logic [7:0] x2,   // (1,8,12)
    output logic [20:0] dout // (1,21,12)
);

    logic [20:0] x1_ext, x2_ext;
    logic [20:0] sum;

    always_comb begin
        // Преобразование x1 к формату с 12 дробными битами
        // Сдвиг влево на 4 бита = умножение на 16
        x1_ext = { {5{x1[15]}}, x1, 4'b0 }; // Знаковое расширение + сдвиг
        
        // Преобразование x2 к 21-битному формату
        x2_ext = { {13{x2[7]}}, x2 };
        
        // Сложение
        sum = x1_ext + x2_ext;
    end

    always_ff @(posedge clk) begin
        dout <= sum;
    end

endmodule