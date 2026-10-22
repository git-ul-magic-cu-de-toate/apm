`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 08:05:43 PM
// Design Name: 
// Module Name: ex5ha
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


module ex5ha(
    output wire o_w_s,
    output wire o_w_c,
    input wire i_w_a,
    input wire i_w_b
    );
    
    xor(o_w_s, i_w_a, i_w_b);
    and(o_w_c, i_w_a, i_w_b);
    
endmodule
