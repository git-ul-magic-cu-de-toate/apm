`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 07:26:40 PM
// Design Name: 
// Module Name: ex3
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


module ex3(
    output wire o_w_out,
    input wire i_w_in0,
    input wire i_w_in1,
    input wire i_w_in2,
    input wire i_w_in3,
    input wire i_w_sel0,
    input wire i_w_sel1
    );
    wire l_w_nsel0;
    wire l_w_nsel1;
    wire l_w_sel_in0;
    wire l_w_sel_in1;
    wire l_w_sel_in2;
    wire l_w_sel_in3;
    
    not(l_w_nsel0, i_w_sel0);
    not(l_w_nsel1, i_w_sel1);
    
    and(l_w_sel_in0, i_w_in0, l_w_nsel0, l_w_nsel1);
    and(l_w_sel_in1, i_w_in1, i_w_sel0, l_w_nsel1);
    and(l_w_sel_in2, i_w_in2, l_w_nsel0, i_w_sel1);
    and(l_w_sel_in3, i_w_in3, i_w_sel0, i_w_sel1);
    
    or(o_w_out, l_w_sel_in0, l_w_sel_in1, 
    l_w_sel_in2, l_w_sel_in3);
    
endmodule
