module lab81 (
    input logic clk,
    input logic srst,
    input logic info,
    output logic [1:0] coded
);

    typedef enum logic [1:0] {init_state, S1, S2, S3} t_state;
    t_state state, nextstate;

    always_ff @(posedge clk) begin
        if (srst)
            state <= init_state;
        else
            state <= nextstate;
    end

    always_comb begin
        nextstate = state;
        case(state)
            init_state: nextstate = info ? S1 : init_state;
            S1: nextstate = info ? S3 : S2;
            S2: nextstate = info ? S1 : init_state;
            S3: nextstate = info ? S3 : S2;
            default: nextstate = init_state;
        endcase
    end
    
    always_ff @(posedge clk) begin
        if (srst) begin
            coded <= 2'b00;
        end else begin
            coded[1] <= info ^ state[1] ^ state[0];
            coded[0] <= info ^ state[0];
        end
    end

endmodule