`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );

assign sum = a ^ b ^ cin;
assign cout = (a ^ b) ? cin : a;

endmodule


module adder
#(parameter w = 8)
(input [w - 1 : 0] a, b,
output [w:0] sum);

wire [w : 0] carry;
assign carry[0] = 1'b0;
genvar i;
generate
for (i = 0; i < w; i = i + 1) begin
    full_adder Si (a[i], b[i], carry[i], sum[i], carry[i + 1]);
end
endgenerate

assign sum[w] = carry[w];
endmodule
