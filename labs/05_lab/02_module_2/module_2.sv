module lab52 (
    input logic clk ,
    input logic srst,
    output logic [15 : 0] dout
);
always_ff @(posedge clk) begin
    if (srst)
        dout <= 16'b1011111010101111;
    else
        dout <= {dout[0], dout[15, 1]}; // циклический сдвиг вправо
end
endmodule