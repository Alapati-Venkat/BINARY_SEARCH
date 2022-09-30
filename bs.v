`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 11:00:46 PM
// Design Name: 
// Module Name: bs
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

module bs(clk,rst,element,en,index,valid);
 input clk,rst;
 input signed[31:0] element;
 input en;
 output valid;
 output reg signed [5:0] index;
 
 parameter N=24; 
 
 reg signed[31:0] mem[N-1:0]; //memory
 
 reg [2:0]ps, ns;
 
 parameter s0=3'b000, s1=3'b001 , s2=3'b010, s3=3'b011 , s4=3'b100;
 
 integer f=0, l=N-1, m=0;// indices of first and last elements

assign valid=~en;
//present state logic
always@(posedge(clk))
begin
    if(rst)
        ps<=s0;
    else
    begin
        ps<=ns;
    end
end

//next state logic
always@(*)
case(ps)
s0: begin // active low enable 
    if(~en)
    begin
     ns=s1;
     index=6'b111111;
    end
     
    end

s1: begin //binary search operation
    m=(f+l)/2;
    if(element<mem[m])
        begin
        ns=s2;
        index=6'b111111;
        end
    else if(element>mem[m])
        begin
        ns=s3;
        index=6'b111111;
        end
    else if(element==mem[m])
        begin
        ns=s4;
        index=6'b111111;
        end

   end

s2:begin

    l=m-1;
    ns=s1;
    index=6'b111111;
    end

s3:begin

    f=m+1;
    ns=s1;
    index=6'b111111;
    end

s4: begin

    index=m;
    f=0;
    l=N-1;
    if(en)
     ns=s0;
    else
     ns=s4;
    end


default: begin
          ns=s0;
          index=6'b111111;
         end 
endcase
endmodule