module lab64 (
    input logic clk ,
    input logic srst,
    output logic [7 : 0] dout
);
logic [26 : 0] cntr = 0;
logic [ 7 : 0] shifter;
logic cntr26d; // Задержанный бит счетчика
logic en;

// Счетчик делитель частоты
always_ff @(posedge clk) begin
    if (srst)
        cntr <= 0;
    else
        cntr <= cntr + 1;
end

// Задержка бита счетчика
always_ff @(posedge clk) begin
    if (srst)
        cntr26d <= 0;
    else 
        cntr26d <= cntr[26];    
end

assign en = cntr[26] and (~cntr26d);

// Сдвиговый регистр
always_ff @(posedge clk) begin
    if (srst)
        shifter <= 8'b00000001;
    else if (en)
        shifter <= {shifter[0], shifter[7:1]};
end

assign dout = shifter;

endmodule