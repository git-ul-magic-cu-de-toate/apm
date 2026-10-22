`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 02:03:19 PM
// Design Name: 
// Module Name: ex2p
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


module ex2p(
    output wire o_w_out0,
    output wire o_w_out1,
    output wire o_w_out2,
    output wire o_w_out3,
    input wire i_w_in,
    input wire i_w_sel0,
    input wire i_w_sel1
    );
    
    reg l_r_out0;
    reg l_r_out1;
    reg l_r_out2;
    reg l_r_out3;
    assign o_w_out0 = l_r_out0;
    assign o_w_out1 = l_r_out1;
    assign o_w_out2 = l_r_out2;
    assign o_w_out3 = l_r_out3;
    
    always @(*) begin
        l_r_out0 = 0;
        l_r_out1 = 0;
        l_r_out2 = 0;
        l_r_out3 = 0;
        case ({i_w_sel1,i_w_sel0})
            2'b00: l_r_out0 = i_w_in;
            2'b01: l_r_out1 = i_w_in;
            2'b10: l_r_out2 = i_w_in;
            2'b11: l_r_out3 = i_w_in;
            default: begin
                l_r_out0 = 0;
                l_r_out1 = 0;
                l_r_out2 = 0;
                l_r_out3 = 0;
            end
        endcase
    end 
    
    
endmodule
