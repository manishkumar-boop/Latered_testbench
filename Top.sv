`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 23:31:24
// Design Name: 
// Module Name: Top
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


`include "Interface.sv"
`include "Enviroment.sv"

module top;

  intf i();

  d_flipflop dut (
    .clk   (i.clk),
    .reset (i.reset),
    .d     (i.d),
    .q     (i.q)
  );

  environment env;

  // clock
  initial i.clk = 0;
  always #5 i.clk = ~i.clk;

  // reset
  initial begin
    i.reset = 1;
    i.d     = 0;
    #20 i.reset = 0;
  end

  // start test
  initial begin
    env = new(i);
    env.run();
  end

  // watchdog
  initial begin
    #2000;
    $display("TIMEOUT");
    $finish;
  end

endmodule