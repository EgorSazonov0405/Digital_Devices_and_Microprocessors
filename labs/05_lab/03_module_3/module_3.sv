module lab53 (
    input logic clk,
    input logic [7:0] din,
    output logic [7:0] dout
);

    always_ff @(posedge clk) begin
        dout <= din;
    end

endmodule