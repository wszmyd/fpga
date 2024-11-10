`timescale 1ns / 1ps

module tb_counter();

localparam w = $clog2(10);
reg clk, rst;
wire [w - 1 : 0] count;

counter UUT(.clk(clk), .rst(rst), .count(count));
initial begin 
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rst = 1;
#20;
rst = 0;
#250;
rst = 1;
#50;
rst = 0;
#200;
$finish();
end

endmodule
