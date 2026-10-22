`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:45:37 PM
// Design Name: 
// Module Name: ex1p
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


module ex1p(
    output wire o_w_out,
    input wire i_w_a,
    input wire i_w_b
    );
    
    reg l_r_out;
    assign o_w_out = l_r_out;
    
    always @(*) begin
        //l_r_out = (i_w_a & ~i_w_b)|(~i_w_a & i_w_b);
        if(i_w_a == 1) begin
            l_r_out = ~i_w_b;
        end else begin
            l_r_out = i_w_b;
        end
    end
    
endmodule
