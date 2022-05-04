`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:15 05/04/2022 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(a,b,select,c);
    input [23:0] a;
     input [23:0] b;
     input [2:0] select;
     output reg [23:0] c;

     always @(select,a,b)
     begin

     case(select)
     3'b 000: c = a&b;
     3'b 001: c = a|b;
     3'b 010: c = a+b;
     3'b 011: c = a-b;
     3'b 100: c = a*b;
     3'b 101: c = a/b;
     3'b 110: c = (a<<b);
     3'b 111: c = (a>>>b);
     
     endcase

     end

endmodule
