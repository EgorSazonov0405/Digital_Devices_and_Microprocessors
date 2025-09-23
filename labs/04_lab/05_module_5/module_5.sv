// Блок, по команде выполняющий операции логического сдвига, арифметического сдвига и циклического сдвига входного 6-разрядного числа.
module lab45 (
    input logic [1 : 0] cmd , // 00 – логический
// 01 – арифметический
// 10 - циклический
// 11 – нет сдвига
    input logic lr , // 0 – влево, 1 - враво
    input logic [5 : 0] din ,
    output logic [5 : 0] dout_din ,
    output logic [6 : 0] dout_shifted
);
assign dout_din = din;
always_comb begin
    case (cmd)
        2'b00: begin // логический
            if (lr == 0) 
                dout_shifted = {din[4:0], 1'b0}; // сдвиг влево
            else 
                dout_shifted = {1'b0, din[5:1]}; // сдвиг вправо
        end
        2'b01: begin // арифметический
            if (lr == 0)
                dout_shifted = {din[4:0], 1'b0}; // сдвиг влево
            else
                dout_shifted = {din[5], din[5:1]}; // сдвиг вправо с расширением знака
        end
        2'b10: begin // циклический
            if (lr == 0)
                dout_shifted = {din[4:0], din[5]}; // циклический влево
            else
                dout_shifted = {din[0], din[5:1]}; // циклический вправо
        end
        default: dout_shifted = din; // нет сдвига
    endcase
end
endmodule