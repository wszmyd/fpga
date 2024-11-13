`timescale 1ns / 1ps

// "1011" sequence detector using Moore FSM

module fsm(input clk, reset, x, output reg y);

reg [3 : 0] state, next_state;
parameter [3 : 0] S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0101, S4 = 4'b1011;

always @(*)
    case (state)
        S0 : if (x) next_state = S1;
             else next_state = S0;
        S1 : if (x) next_state = S1;
             else next_state = S2;
        S2 : if (x) next_state = S3;
             else next_state = S0;
        S3 : if (x) next_state = S4;
             else next_state = S2;
        S4 : if (x) next_state = S1;
             else next_state = S0;
    endcase
    
always @(posedge clk)
    if (reset)
        state <= 0;
    else state <= next_state;
    
always @(*)
    if (state == S4)
        y = 1;
    else y = 0;
    
endmodule