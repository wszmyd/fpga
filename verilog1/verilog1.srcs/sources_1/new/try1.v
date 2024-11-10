`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2024 16:28:56
// Design Name: 
// Module Name: try1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module try1(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    assign s = a ^ b ^ cin;
    assign cout = (a ^ b) ? cin : a;
endmodule

module adder
(input [w - 1 : 0] a, b,
output [w:0] s);

parameter w = 8;
wire [w : 0] carry;
assign carry[0] = 1'b0;
genvar i;
generate
for (i = 0; i < w; i = i + 1) begin
    FA Si (a[i], b[i], carry[i], s[i], carry[i + 1]);
end
endgenerate

assign s[w] = carry[w];
endmodule
