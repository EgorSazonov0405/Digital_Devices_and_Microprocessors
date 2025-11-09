module mul (
    input logic [2 : 0] x1,
    input logic [2 : 0] x2,
    output logic [3:0] y
);

assign y = x1 * x2;

endmodule