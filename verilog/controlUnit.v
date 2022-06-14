`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:40 06/14/2022 
// Design Name: 
// Module Name:    cu 
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
module controlUnit(OpCode, RegDst, ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, BranchEq, BranchGr, Jump, ExtOp, AluOp, clk
    );
    input[5:0] OpCode;
    input clk;
    output reg RegDst;
    output reg ALUSrc;
    output reg MemToReg;
    output reg RegWrite;
    output reg MemWrite;
    output reg MemRead;
    output reg BranchEq;
    output reg BranchGr;
    output reg Jump;
    output reg ExtOp;
    output reg[2:0] AluOp;

    always @(clk)
        begin

        //R-Type
        if(OpCode == 6'b000000)
        begin
            RegDst = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 0;
            AluOp=4;
                

        end
        
        //addi
       else if(OpCode == 6'b 000001)
        begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 0;
            AluOp=2;
                
        end

        //ori
        else if(OpCode == 6'b 000010)
        begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 0;
            AluOp = 1;
                
        end
        
        //andi
      else  if(OpCode == 6'b000011)
        begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 0;
            AluOp = 0;
        end
        
        //lw
       else if(OpCode == 6'b 000100)
        begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 1;
            RegWrite = 1;
            MemWrite = 0;
            MemRead = 1;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 1;
            AluOp=2;
                
        end
        
        //sw
       else if(OpCode == 6'b000101)
        begin
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemWrite = 1;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 1;
            AluOp = 2;
        end
        
        //beq
       else if(OpCode == 6'b 000110)
        begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 1;
            BranchGr = 0;
            Jump = 0;
            ExtOp = 1;
            AluOp=3;
                
        end
        
        //bgt
       else if(OpCode == 6'b 000111)
        begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 1;
            Jump = 0;
            ExtOp = 1;
            AluOp=3;
            
        end
        
        //jump
       else if(OpCode == 6'b001000)
        begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemWrite = 0;
            MemRead = 0;
            BranchEq = 0;
            BranchGr = 0;
            Jump = 1;
            ExtOp = 0;
            AluOp = 0;
        end
        
    end

endmodule
