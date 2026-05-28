`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 19:30:28
// Design Name: 
// Module Name: systolic_array_tb
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


`timescale 1ns / 1ps

module systolic_array_tb;

reg clk;
reg rst;

reg [7:0] a_in [0:15];
reg [7:0] b_in [0:15];

wire [31:0] c [0:15][0:15];

integer i, j;

// DUT
systolic_array uut (
    .clk(clk),
    .rst(rst),
    .a_in(a_in),
    .b_in(b_in),
    .c(c)
);

// Clock
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    // Reset
    #10 rst = 0;

    // Inputs
    for(i = 0; i < 16; i = i + 1)
    begin
        a_in[i] = i + 1;
        b_in[i] = i + 1;
    end

    // Wait
    #200;

    // Print outputs
    for(i = 0; i < 16; i = i + 1)
    begin
        for(j = 0; j < 16; j = j + 1)
        begin
            $display("c[%0d][%0d] = %0d", i, j, c[i][j]);
        end
    end

    $finish;

end

endmodule