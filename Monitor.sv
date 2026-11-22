`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 22:36:13
// Design Name: 
// Module Name: Monitor
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
class monitor;

virtual intf vif;
mailbox  mon2scb;
transaction tr;

function new(virtual intf vif , mailbox mon2scb);
this.vif = vif;
this.mon2scb = mon2scb;
endfunction

task run;

repeat(10) 
           begin
           @(posedge vif.clk);
           #1;
           tr = new();
           tr.d = vif.d;
           tr.q = vif.q;
           mon2scb.put(tr);
           end
endtask
endclass


