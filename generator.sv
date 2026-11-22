`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 21:26:09
// Design Name: 
// Module Name: generator
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

class generator;

transaction tr;
mailbox gen2drv;

function new(mailbox mail);
gen2drv = mail;
endfunction

task run;
repeat(10)begin
      tr = new();
      assert(tr.randomize())
      else $fatal("Failed Execution");
      gen2drv.put(tr);
end

endtask
endclass
