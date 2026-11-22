`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 21:43:30
// Design Name: 
// Module Name: Driver
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

class driver;

transaction tr;
mailbox gen2drv;
virtual intf vif;

function new(virtual  intf vif , mailbox mail);
this.vif = vif;
gen2drv = mail;
endfunction

task run;

repeat(10)begin

gen2drv.get(tr);

@(posedge vif.clk);
vif.d <= tr.d;

end
endtask

endclass





















