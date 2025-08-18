`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 19:28:42
// Design Name: 
// Module Name: tb_seq_detect_mealy
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


module tb_seq_detect_mealy();
reg clk,rst,din;
wire y;

seq_detect_mealy dut(clk,rst,din,y);

always #5 clk = ~clk;

initial begin
clk=0;rst=1;din=0;
#10 rst=0;
#10 din=1;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=1;
#10 din=1;
#10 din=0;
#10 din=1;
#10 $stop;
end
endmodule
