module lab51 (
    input logic clk ,
    input logic clear ,
    input logic preset,
    input logic j ,
    input logic k ,
    input logic e ,
    output logic jk_out
);
always_ff @(posedge clk or posedge clear or posedge preset) begin
    if (clear)
        jk_out <= 1'b0;
    else if (preset)
        jk_out <= 1'b1;
    else if (e) begin
        case ({j, k})
            2'b00: jk_out <= jk_out;
            2'b01: jk_out <= 1'b0;
            2'b10: jk_out <= 1'b1;
            2'b11: jk_out <= ~jk_out;
        endcase
    end
end
endmodule