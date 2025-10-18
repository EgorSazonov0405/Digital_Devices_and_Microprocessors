module lab81 (
    input logic clk,
    input logic srst,
    input logic info,
    output logic [1:0] coded
);

    // Состояния автомата как в примере
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
            S0: if (info) nextstate = S1;
            S1: if (info) nextstate = S3; else nextstate = S2;
            S2: if (info) nextstate = S1; else nextstate = init_state;
            S3: if (info) nextstate = S3; else nextstate = S2;
            default: nextstate = init_state;
        endcase
    end
    
    always_ff @(posedge clk) begin
        if (srst) begin
            coded <= 2'b00;
        end else begin
            coded <= 2'b00; 
            case(nextstate) 
                init_state: if (info) coded <= 2'b11;
                S1: if (info) coded <= 2'b00; else coded <= 2'b10;
                S2: if (info) coded <= 2'b01; else coded <= 2'b11;
                S3: if (info) coded <= 2'b10; else coded <= 2'b01;
                default: ;
            endcase
        end
    end

endmodule