`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 08:16:43 PM
// Design Name: 
// Module Name: simulare_mux
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


module simulare_mux;
    reg A, B, C, D;
    reg a, b;
    wire Q;

    mux my_mux(Q, A, B, C, D, a, b);

    initial begin
        A = 1; B = 0; C = 1; D = 0; a = 0; b = 0;
        #10;
        A = 1; B = 0; C = 1; D = 0; a = 0; b = 1;
        #10;
        A = 1; B = 0; C = 1; D = 0; a = 1; b = 0;
        #10;
        A = 1; B = 0; C = 1; D = 0; a = 1; b = 1;
        #10;
        $finish;
    end
endmodule
