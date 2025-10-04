module lab62 (
    input logic clk ,
    output logic dout
);

logic [26 : 0] cntr = 0;

always_ff @(posedge clk) begin
    cntr <= cntr + 1;    
end

assign dout = cntr[26];

endmodule