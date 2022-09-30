`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 11:01:57 PM
// Design Name: 
// Module Name: bs_tb
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

module bs_tb();
reg clk,rst;
reg  signed[31:0] element;
reg en;
wire signed [5:0] index;
wire valid;
 
bs dut(clk,rst,element,en,index,valid);
//clock generation
initial begin
  clk=0;
  forever #5 clk=~clk;
end


//defining memory
initial begin
  rst=1;
  dut.mem[0]=32'b11000000101000000000000000000000;//-5
  dut.mem[1]=32'b11000000100100000000000000000000;//-4.5
  dut.mem[2]=32'b11000000010000000000000000000000;//-3
  dut.mem[3]=32'b11000000000000000000000000000000;//-2
  dut.mem[4]=32'b10111111110000000000000000000000;//-1.5
  dut.mem[5]=32'b00000000000000000000000000000000;//0
  dut.mem[6]=32'b00111111100000000000000000000000;//1
  dut.mem[7]=32'b01000000000100000000000000000000;//2.25;
  dut.mem[8]=32'b01000000010000000000000000000000;//3;
  dut.mem[9]=32'b01000000100100000000000000000000;//4.5;
  dut.mem[10]=32'b01000000101000000000000000000000;//5;
  dut.mem[11]=32'b01000000110110000000000000000000;//6.75;
  dut.mem[12]=32'b01000000111000000000000000000000;//7;
  dut.mem[13]=32'b01000001000010000000000000000000;//8.5;
  dut.mem[14]=32'b01000001000101000000000000000000;//9.25;
  dut.mem[15]=32'b01000001001000000000000000000000;//10;
  dut.mem[16]=32'b01000001010011000000000000000000;//12.75;
  dut.mem[17]=32'b01000001011001000000000000000000;//14.25;
  dut.mem[18]=32'b01000001011110000000000000000000;//15.5;
  dut.mem[19]=32'b01000001100001000000000000000000;//16.5;
  dut.mem[20]=32'b01000001100100100000000000000000;//18.25;
  dut.mem[21]=32'b01000011011000010000000000000000;//225;
  dut.mem[22]=32'b01000101001110111000010000000000;//3000.25;
  dut.mem[23]=32'b01000111100000000000100000100000;//65552.255;
  en=0;
  #10; rst=0;
  #10; element=32'b01000000000100000000000000000000;//2.25;
  #300;   en=1; 
  #10; en=0; element=32'b01000001000101000000000000000000;//9.25;
  #300;   en=1; 
  #10; en=0; element=32'b01000101001110111000010000000000;//3000.25;
  #300; $finish;
end
endmodule