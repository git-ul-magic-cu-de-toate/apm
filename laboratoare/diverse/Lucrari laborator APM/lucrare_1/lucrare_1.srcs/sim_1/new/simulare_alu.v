`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 10:28:10 PM
// Design Name: 
// Module Name: simulare_alu
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


module simulare_alu;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] Select;
    wire [3:0] Out;
    wire Overflow;

    alu my_alu(A, B, Select, Out, Overflow);

    initial begin
        A = 4'b0011;
        B = 4'b0101;
        Select = 3'b000;
        #10;
        
        A = 4'b1100;
        B = 4'b1100;
        Select = 3'b001;
        #10;
        
        A = 4'b1010;
        B = 4'b0000;
        Select = 3'b010;
        #10;
        
        A = 4'b0000;
        B = 4'b0011;
        Select = 3'b011;
        #10;
        
        A = 4'b1100;
        B = 4'b1010;
        Select = 3'b100;
        #10;

        $finish;
    end

endmodule

