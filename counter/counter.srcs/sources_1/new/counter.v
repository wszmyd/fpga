`timescale 1ns / 1ps

module counter
(   
    input clk,
    input rst,
    output reg [w - 1 : 0] count = 0
);
    parameter up = 0;
    parameter N = 10;
    localparam w = $clog2(N);  //bit width of the counter
    
always @ (posedge clk)
    if (rst)
        count <= 0;
    else if (up)
        if (count == N - 1)
            count <= 0;
        else
            count <= count + 1;
    else
        if (count == 0)
            count <= N - 1;
        else
            count <= count - 1;
endmodule;
    

