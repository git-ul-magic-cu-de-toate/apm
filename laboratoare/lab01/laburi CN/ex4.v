`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 07:41:54 PM
// Design Name: 
// Module Name: ex4
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


module ex4(
    output wire o_w_out,
    input wire i_w_a,
    input wire i_w_b,
    input wire i_w_sel0,
    input wire i_w_sel1
    );
    
    wire l_w_xor;
    wire l_w_or;
    wire l_w_and;
    wire l_w_nand;
    
    ex2 l_m_ex2_0 (.o_w_c(l_w_xor),
     .i_w_a(i_w_a), .i_w_b(i_w_b));
    
    or(l_w_or, i_w_a, i_w_b);
    and(l_w_and, i_w_a, i_w_b);
    nand(l_w_nand, i_w_a, i_w_b);
    
    ex3 l_m_ex3_0 (.o_w_out(o_w_out),
        .i_w_in0(l_w_nand),
        .i_w_in1(l_w_and),
        .i_w_in2(l_w_or),
        .i_w_in3(l_w_xor),
        .i_w_sel0(i_w_sel0),
        .i_w_sel1(i_w_sel1));
endmodule
