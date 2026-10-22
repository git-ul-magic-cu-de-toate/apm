`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:57 04/03/2022 
// Design Name: 
// Module Name:    task0 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module task0(
		output wire o_w_sum,
		output wire o_w_carry,
		input wire i_w_bit_A,
		input wire i_w_bit_B
    );
	
	/* TODO: IMPLEMENT HALF-ADDER */
	assign o_w_sum = i_w_bit_A ^ i_w_bit_B;
	assign o_w_carry = i_w_bit_A & i_w_bit_B;

endmodule
