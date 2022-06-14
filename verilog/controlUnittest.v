`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:10:17 06/14/2022
// Design Name:   controlUnit
// Module Name:   D:/uni/term4/memary/verilog_h/cu/controlUnittest.v
// Project Name:  cu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnittest;

    // Inputs
    reg [5:0] OpCode;
    reg clk;

    // Outputs
    wire RegDst;
    wire ALUSrc;
    wire MemToReg;
    wire RegWrite;
    wire MemWrite;
    wire MemRead;
    wire BranchEq;
    wire BranchGr;
    wire Jump;
    wire ExtOp;
    wire [2:0] AluOp;

    // Instantiate the Unit Under Test (UUT)
    controlUnit uut (
        .OpCode(OpCode), 
        .RegDst(RegDst), 
        .ALUSrc(ALUSrc), 
        .MemToReg(MemToReg), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .BranchEq(BranchEq), 
        .BranchGr(BranchGr), 
        .Jump(Jump), 
        .ExtOp(ExtOp), 
        .AluOp(AluOp), 
        .clk(clk)
    );

    initial begin
        // Initialize Inputs
        OpCode = 2;
        clk = 0;

        // Wait 100 ns for global reset to finish
        #100;
        OpCode = 2;
        #100;
        OpCode = 3;
        #100;
        OpCode = 6;
        #100;
        OpCode = 0;
        
        // Add stimulus here
        

    end
    always #50 clk=~clk;
      
endmodule
