`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 23:50:36
// Design Name: 
// Module Name: systolic_array
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


module systolic_array(
input clk,
 input rst,
input [7:0] a_in [0:15],
input [7:0] b_in [0:15],
output [31:0]c[0:15][0:15]
    );
    
    
    
wire [7:0] a_wire [0:15][0:16];

wire [7:0] b_wire [0:16][0:15];





genvar i, j;

generate
for(i = 0; i < 16; i = i + 1)
begin

    assign a_wire[i][0] = a_in[i];
    assign b_wire[0][i] = b_in[i];

end
    for(i = 0; i < 16; i = i + 1)
    begin : ROW

        for(j = 0; j < 16; j = j + 1)
        begin : COLS

            pe PE (

                .clk   (clk),
                .rst   (rst),

                .a_in  (a_wire[i][j]),
                .b_in  (b_wire[i][j]),

                .a_out (a_wire[i][j+1]),
                .b_out (b_wire[i+1][j]),

                .sum   (c[i][j])

            );

        end

    end

endgenerate

endmodule
