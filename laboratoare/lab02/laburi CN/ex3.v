`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 02:08:55 PM
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
    output wire o_w_clk,
    input wire i_w_clk,
    input wire i_w_reset
    );
    
    reg l_r_clk;
    assign o_w_clk = l_r_clk;
    
    always @(posedge i_w_clk) begin
        if(i_w_reset == 1) begin
            l_r_clk = 0;
        end else begin
            l_r_clk = ~l_r_clk;
        end
    end
    
endmodule
