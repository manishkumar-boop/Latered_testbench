`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 23:07:28
// Design Name: 
// Module Name: Scoreboard
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

class scoreboard;

transaction tr;
mailbox mon2scb;
logic [3:0] prev_d = 0;
int count = 0;

function new(mailbox mon2scb);
this.mon2scb = mon2scb;
endfunction

task run;
          repeat(10) begin
          mon2scb.get(tr);
          
          if(count >= 2)begin
          if((tr.q) == (prev_d))
          $display("Result is expected");
          else
          $error("result mismatch");
          
          prev_d = tr.d;
          count++;
          end
          end
endtask
endclass
