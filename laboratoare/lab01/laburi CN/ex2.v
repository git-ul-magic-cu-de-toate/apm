`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 07:10:39 PM
// Design Name: 
// Module Name: ex2
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


module ex2(
    output wire o_w_c,
    input wire i_w_a,
    input wire i_w_b
    );
    
    wire l_w_t1;
    wire l_w_t2;
    
    or(l_w_t1, i_w_a, i_w_b);
    nand(l_w_t2, i_w_a, i_w_b);
    and(o_w_c, l_w_t1, l_w_t2);
    
endmodule
