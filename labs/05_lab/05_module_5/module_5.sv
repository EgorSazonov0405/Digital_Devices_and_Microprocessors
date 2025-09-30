`timescale 1ns / 1ps

module lab55 (
    input logic clk,
    input logic srst,
    output logic [1:0] coded
);

    logic info_bit;
    logic [5:0] coder_reg;

    // Экземпляр генератора ПСП из задания 4
    lab54 inst_lab54 (
        .clk(clk),
        .srst(srst),
        .psp_bit(info_bit)
    );

    // Регистр кодера (6 бит)
    always_ff @(posedge clk) begin
        if (srst)
            coder_reg <= 6'b000000;
        else
            coder_reg <= {coder_reg[4:0], info_bit};
    end

    // Полином 171 (1111001 в двоичной) - биты: 0,1,2,5
    // Полином 133 (1011011 в двоичной) - биты: 0,1,3,4,5
    
    // Младший бит выхода (полином 171)
    assign coded[0] = info_bit ^ coder_reg[0] ^ coder_reg[1] ^ coder_reg[2] ^ coder_reg[5];
    
    // Старший бит выхода (полином 133)  
    assign coded[1] = info_bit ^ coder_reg[0] ^ coder_reg[1] ^ coder_reg[3] ^ coder_reg[4] ^ coder_reg[5];

endmodule