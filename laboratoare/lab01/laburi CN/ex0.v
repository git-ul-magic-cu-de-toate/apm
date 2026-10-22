`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 07:03:01 PM
// Design Name: 
// Module Name: ex0
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


module ex0(
    output wire o_w_c,
    output wire o_w_d,
    input wire i_w_a,
    input wire i_w_b
    );
    
    and(o_w_c, i_w_a, i_w_b);
    or(o_w_d, i_w_a, i_w_b);
   
endmodule
