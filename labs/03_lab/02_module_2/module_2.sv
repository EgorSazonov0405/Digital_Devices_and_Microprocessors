// Двухадресный демультиплексор с четырьмя выходами
module lab 32(
    input logic din ,
    input logic [1 : 0] addr,
    output logic [3 : 0] dout
);
always_comb begin
    dout = 4'b0000; // default 0
    case (addr)
        2'b00 : dout[0] = din;
        2'b01 : dout[1] = din;
        2'b10 : dout[2] = din;
        2'b11 : dout[3] = din;
    endcase
end
endmodule