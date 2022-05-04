`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:15:47 05/04/2022
// Design Name:   ALU
// Module Name:   D:/uni/term4/memary/verilog_h/ALU_3bit/ALU_test.v
// Project Name:  ALU_3bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [23:0] a;
	reg [23:0] b;
	reg [2:0] select;

	// Outputs
	wire [23:0] c;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.select(select), 
		.c(c)
	);

   initial begin
        // Initialize Inputs
        a = 4;
        b = 2;
        select = 0;
        #100;
		  
		  a = 4;
        b = 2;
        select = 1;
        #100;
		  
        a = 4;
        b = 2;
        select = 2;
        #100;
		  
		  a = 4;
        b = 2;
        select = 3;
        #100;
		  
		  a = 4;
        b = 2;
        select = 4;
        #100;
		  
        a = 4;
        b = 2;
        select = 5;
        #100;
		  
        a = 4;
        b = 2;
        select = 6;
        #100;
		  
        a = 4;
        b = 2;
        select = 7;
        #100;
		  

    end

endmodule

