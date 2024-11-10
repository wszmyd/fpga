`timescale 1ns / 1ps

module tb_fsm();
    reg clk;
    reg reset;
    reg x;
    wire y;

fsm UUT (.clk(clk), .reset(reset), .x(x), .y(y));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    x = 0;
    reset = 1;
    #50
    reset = 0;
    #10
    x = 1;
    #10
    x = 0;
    #10
    x = 1;
    #10
    x = 1;
    #10
    x = 0;
    #10
    x = 1;
    #10
    x = 0;
    #10
    x = 1;
    #10
    x = 1;
    #10
    x = 1;
    #20
    $finish();
end  


endmodule