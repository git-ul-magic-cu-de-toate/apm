`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 10:03:48 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] Select,
    output reg [3:0] Out,
    output reg Overflow
);

    reg [4:0] result;

    always @(A or B or Select) begin
        case (Select)
            3'b000:
            begin
                result = A + B;
                Out = result[3:0];
                Overflow = result[4];
            end

            3'b001:
            begin
                if (A == B)
                    Out = 4'b1111;
                else
                    Out = 4'b0000;
                Overflow = 0;
            end

            3'b010:
            begin
                Out = A >> 1;
                Overflow = 0;
            end

            3'b011:
            begin
                Out = ~B + 1;
                Overflow = 0;
            end

            3'b100:
            begin
                Out = A & B;
                Overflow = 0;
            end

            default:
            begin
                Out = 4'b0000;
                Overflow = 0;
            end
        endcase
    end

endmodule

