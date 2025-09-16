// Двухадресный мультиплексор с четырьмя входами.
module lab31 (
    input logic [3 : 0] din ,
    input logic [1 : 0] addr,
    output logic dout
);

always_comb begin
    case (addr)
        2'b00: dout = din[0];
        2'b01: dout = din[1];
        2'b10: dout = din[2];
        2'b11: dout = din[3];
        default: dout = 1'b0;
    endcase
end

endmodule