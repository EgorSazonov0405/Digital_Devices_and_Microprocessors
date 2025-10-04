module lab61 (
    input logic clk ,
    input logic srst,
    output [7 : 0] logic dout
);
logic [29 : 0] cntr;

always_ff @(posedge clk) begin
    if (srst)
        cntr <= 30'b0;
    else 
        cntr <= cntr + 1;    
end

assign dout = cntr[29 : 22];

endmodule