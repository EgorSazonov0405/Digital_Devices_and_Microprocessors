`timescale 1ns / 1ps

module lab54 (
    input logic clk,
    input logic srst,
    output logic psp_bit
);

    logic [14:0] shift_reg; // 15-битный регистр сдвига

    always_ff @(posedge clk) begin
        if (srst)
            shift_reg <= 15'b101010001110110;
        else
            shift_reg <= {shift_reg[13:0], shift_reg[14] ^ shift_reg[13]};
    end

    assign psp_bit = shift_reg[14] ^ shift_reg[13];

endmodule