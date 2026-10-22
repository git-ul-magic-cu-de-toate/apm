`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 05:33:34 PM
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
    input wire i_w_in,
    input wire i_w_clk,
    input wire i_w_reset
    );
    
    reg [28:0] l_r_contor;
    reg l_r_old_value;
    reg l_r_value;
    
    assign o_w_out = l_r_value;
    
    always @(posedge i_w_clk) begin
        if(i_w_reset == 1) begin
            l_r_contor = 0;
            l_r_old_value = 0;
            l_r_value = 0;
        end else begin
            if( i_w_in == l_r_old_value) begin
                l_r_contor = l_r_contor + 1;
                if(l_r_contor[28]==1) begin
                    l_r_value = i_w_in;
                    l_r_contor = 0;
                end
            end else begin
                l_r_contor = 0;
            end
            l_r_old_value = i_w_in;
        end
    end
    
endmodule
