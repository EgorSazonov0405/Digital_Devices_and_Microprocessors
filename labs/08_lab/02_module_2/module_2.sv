module lab82 (
    input logic clk,
    input logic srst,
    input logic btn,
    input logic [2:0] x1,
    input logic [2:0] x2,
    output logic [7:0] y
);

    typedef enum logic [1:0] {STATE_WAIT, STATE_SUM, STATE_MUL, STATE_GRAY} t_state;
    t_state state, nextstate;

    logic [7:0] blink_counter;
    logic [7:0] gray_counter;
    logic blink_signal;
    logic btn_prev;
    
    always_ff @(posedge clk) begin
        if (srst)
            state <= STATE_WAIT;
        else
            state <= nextstate;
    end
    
    always_comb begin
        nextstate = state;
        case(state)
            STATE_WAIT: if (btn & ~btn_prev) nextstate = STATE_SUM;
            STATE_SUM:  if (btn & ~btn_prev) nextstate = STATE_MUL;
            STATE_MUL:  if (btn & ~btn_prev) nextstate = STATE_GRAY;
            STATE_GRAY: if (btn & ~btn_prev) nextstate = STATE_WAIT;
            default: nextstate = STATE_WAIT;
        endcase
    end
    
    always_ff @(posedge clk) begin
        if (srst) begin
            y <= 8'b0;
            blink_counter <= 8'b0;
            gray_counter <= 8'b0;
            blink_signal <= 1'b0;
            btn_prev <= 1'b0;
        end else begin
            btn_prev <= btn;
            
            blink_counter <= blink_counter + 1;
            if (blink_counter == 8'd255) begin
                blink_counter <= 8'b0;
                blink_signal <= ~blink_signal;
            end
            
            gray_counter <= gray_counter + 1;
        
            y <= 8'b0; 
            case(nextstate)
                STATE_WAIT: y <= {7'b0, blink_signal};
                STATE_SUM:  y <= {5'b0, ({1'b0, x1} + {1'b0,x2})};
                STATE_MUL:  y <= {2'b0, ({1'b0, x1} * {1'b0, x2})};
                STATE_GRAY: y <= gray_counter ^ (gray_counter >> 1);
                default: y <= 8'b0;
            endcase
        end
    end

endmodule