`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:14 05/05/2022 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(funct, aluop, aluctr
    );
	 
	 input [5:0] funct;
	 input [2:0] aluop;
	 output reg [2:0] aluctr;
	 
	 always @(funct, aluop, aluctr)
	 begin
	 
	 if(aluop[2] == 0)
		aluctr = aluop;
		
	 else
		aluctr[0] = funct[2] & (~funct[3]) & (~funct[4]) & (~funct[5]);
		aluctr[1] = funct[0] & (~funct[3]) & (~funct[4]) & (~funct[5]);
		aluctr[2] = funct[1] & (~funct[3]) & (~funct[4]) & (~funct[5]);
		
	 end
	 


endmodule
