`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 23:26:07
// Design Name: 
// Module Name: D_flipflop
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



module d_flipflop(
    input logic [3:0] d,
    input logic clk, reset,
    output logic [3:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 4'b0000;
    else
        q <= d;
end

endmodule
