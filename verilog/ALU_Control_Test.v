`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:56:28 05/05/2022
// Design Name:   ALU_Control
// Module Name:   D:/ISE Desgn/verilog1/alucontrol/ALU_Cotrol_Unit/ALU_Control_Test.v
// Project Name:  ALU_Cotrol_Unit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Alu_Control_Test;

	// Inputs
	reg [5:0] funct;
	reg [2:0] aluop;

	// Outputs
	wire [2:0] aluctr;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.funct(funct), 
		.aluop(aluop), 
		.aluctr(aluctr)
	);

	initial begin
		// Initialize Inputs
		funct = 6'b001000;
		aluop = 3'b100;

		// Wait 100 ns for global reset to finish
		#100;
		
		funct = 6'b010101;
		aluop = 3'b000;
		#100;
		
		funct = 6'b000100;
		aluop = 3'b100;
		#100;
		
		funct = 6'b010101;
		aluop = 3'b001;
		#100;
		
		funct = 6'b000001;
		aluop = 3'b100;
		#100;
		
        
		// Add stimulus here

	end
      
endmodule

