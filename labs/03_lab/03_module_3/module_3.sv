// Коммутатор 4х4 одноразрядных сигналов с использованием компонентов.
module lab33 (
    input logic [3 : 0] din ,
    input logic [1 : 0] addr1,
    input logic [1 : 0] addr2,
    output logic [3 : 0] dout
);
// Внутренний сигнал для соед. мультиплексора и демультиплексора
logic mux_out;
// мультиплексор
lab31 mux (
    .din(din),
    .addr(addr1),
    .dout(mux_out)
);
lab32 demux (
    .din(mux_out),
    .addr(addr2),
    .dout(dout)
);

endmodule