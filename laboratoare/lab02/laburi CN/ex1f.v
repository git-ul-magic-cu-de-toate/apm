`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:40:11 PM
// Design Name: 
// Module Name: ex1f
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


module ex1f(
    output wire o_w_out,
    input wire i_w_a,
    input wire i_w_b
    );
    
    assign o_w_out = (i_w_a & ~i_w_b)|(~i_w_a & i_w_b);
    
endmodule
