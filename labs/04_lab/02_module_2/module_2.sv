// Сумматор знакового семиразрядного числа и константы (cnst = 3)
module lab42 (
    input logic signed [6 : 0] x,
    output logic signed [7 : 0] y
);

localparam logic signed [7 : 0] cnst = 8'sd3; // Знаковая константа
assign y = x + cnst;

endmodule