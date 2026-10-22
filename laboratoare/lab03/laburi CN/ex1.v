`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 04:25:44 PM
// Design Name: 
// Module Name: ex1
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


module ex1(
    output wire [1:0] o_w_out,
    input wire [1:0] i_w_in0,
    input wire [1:0] i_w_in1,
    input wire [1:0] i_w_sel,
    input wire i_w_clk,
    input wire i_w_reset
    );
    
    reg [1:0] l_r_res;
    assign o_w_out = l_r_res;
    
    always @(posedge i_w_clk) begin
        if(i_w_reset == 1) begin
            l_r_res = 2'b00;
        end else begin
            case(i_w_sel)
                2'b00: l_r_res = i_w_in0 ^ i_w_in1;
                2'b01: l_r_res = ~(i_w_in0 & i_w_in1);
                2'b10: l_r_res = i_w_in0 | i_w_in1;
                2'b11: l_r_res = i_w_in0 & i_w_in1;
                default: l_r_res = 0;
            endcase
        end
    end
endmodule
