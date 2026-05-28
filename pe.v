`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 23:19:12
// Design Name: 
// Module Name: pe
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


module pe (
    input clk,
    input rst,

    input [7:0] a_in,
    input [7:0] b_in,

    output reg [7:0] a_out,
    output reg [7:0] b_out,

    output reg [31:0] sum
);

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        a_out <= 0;
        b_out <= 0;
        sum   <= 0;
    end
    else
    begin
      
        a_out <= a_in;
        b_out <= b_in;

    
        sum <= sum + (a_in * b_in);
    end
end
endmodule
