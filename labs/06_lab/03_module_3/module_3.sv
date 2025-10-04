module lab63 (
    input logic clk ,
    input logic srst,
    input logic mode, // 0 - count up, 1 - count down
    output logic [7 : 0] dout
);
logic [29 : 0] cntr = 0;

always_ff @(posedge clk) begin
    if (srst)
        cntr <= 30'b0;
    else if (mode)
        cntr <= cntr - 1;
    else 
        cntr <= cntr + 1;    
end

assign dout = cntr[29 : 22];
endmodule