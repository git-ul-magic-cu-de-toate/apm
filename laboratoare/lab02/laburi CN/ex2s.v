`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:50:45 PM
// Design Name: 
// Module Name: ex2s
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


module ex2s(
    output wire o_w_out0,
    output wire o_w_out1,
    output wire o_w_out2,
    output wire o_w_out3,
    input wire i_w_in,
    input wire i_w_sel0,
    input wire i_w_sel1
    );
    
    wire l_w_nsel0;
    wire l_w_nsel1;
    
    not(l_w_nsel0, i_w_sel0);
    not(l_w_nsel1, i_w_sel1);
    
    and(o_w_out0, i_w_in, l_w_nsel0, l_w_nsel1);
    and(o_w_out1, i_w_in, i_w_sel0, l_w_nsel1);
    and(o_w_out2, i_w_in, l_w_nsel0, i_w_sel1);
    and(o_w_out3, i_w_in, i_w_sel0, i_w_sel1);
    
    
endmodule
