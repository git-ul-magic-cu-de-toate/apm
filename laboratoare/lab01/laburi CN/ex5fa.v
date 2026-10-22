`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 08:11:15 PM
// Design Name: 
// Module Name: ex5fa
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


module ex5fa(
    output wire o_w_s,
    output wire o_w_c,
    input wire i_w_a,
    input wire i_w_b,
    input wire i_w_c
    );
    
    wire l_w_s0;
    wire l_w_c0;
    wire l_w_c1;
    
    ex5ha l_m_ex5ha_0 (.o_w_s(l_w_s0),
                    .o_w_c(l_w_c0),
                    .i_w_a(i_w_a),
                    .i_w_b(i_w_b));
    ex5ha l_m_ex5ha_1 (.o_w_s(o_w_s),
                    .o_w_c(l_w_c1),
                    .i_w_a(l_w_s0),
                    .i_w_b(i_w_c));
    or(o_w_c, l_w_c0, l_w_c1);
    
endmodule
