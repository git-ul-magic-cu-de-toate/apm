`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		task3
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task3(
		output wire o_w_barrow,
		output wire [7:0] o_w_diff,
		input wire [7:0] i_w_A,
		input wire [7:0] i_w_B,
		input wire i_w_barrow
    );

	// TODO 3: Implementai un scztor pe 8 bii folosind sumatorul ripple-carry implementat
	// Convenie: o_w_result = A - B
	// Hint: Complement fa de 2
	
	task2 subtractor(o_w_barrow, o_w_diff, i_w_A, ~i_w_B, ~i_w_barrow);
	
	
endmodule
