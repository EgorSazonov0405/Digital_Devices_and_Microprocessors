module module_1 (
    input logic a, 
    input logic b,
    outputs logic y_and, 
    outputs logic y_or, 
    outputs logic y_xor, 
    outputs logic y_not, 
    outputs logic y_nand, 
    outputs logic y_nor, 
    outputs logic y_xnor, 
);
    assign y_and = a & b;
    assign y_or = a | b;
    assign y_xor = a ^ b;
    assign y_not = ~ a;
    assign y_nand = ~ (a & b);
    assign y_nor = ~ (a & b);
    assign y_xnor = ~ (a & b);
endmodule