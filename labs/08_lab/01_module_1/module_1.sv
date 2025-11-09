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
            init_state: nextstate = info ? S2 : init_state;
            S1: nextstate = info ? S2 : init_state;
            S2: nextstate = info ? S3 : S1;
            S3: nextstate = info ? S3 : S1;
            default: nextstate = init_state;
        endcase
    end
    
    always_ff @(posedge clk) begin
        if (srst) begin
            coded <= 2'b00;
        end else begin
            case (nextstate) 
                init_state: coded <= info ? 2'b11 : 2'b00;
                S1: coded <= info ? 2'b00 : 2'b11;
                S2: coded <= info ? 2'b01 : 2'b10;
                S3: coded <= info ? 2'b10 : 2'b01;
                default: coded <= 2'b00;
            endcase         
        end
    end

endmodule