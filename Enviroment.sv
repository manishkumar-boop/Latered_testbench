`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 23:19:52
// Design Name: 
// Module Name: Enviroment
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

`include "transaction.sv"
`include "generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class environment;

  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard sco;

  mailbox gen2drv;
  mailbox mon2scb;

  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;

    gen2drv = new();
    mon2scb = new();

    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    sco = new(mon2scb);
  endfunction

  task run;
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join
    $display("Test done");
    $finish;
  endtask

endclass