`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		task1
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task1(
		output wire o_w_sum,
		output wire o_w_carry_out,
		input wire i_w_bit_A,
		input wire i_w_bit_B,
		input wire i_w_carry_in
    );
	
	// TODO 1.5: Implementai un full-adder folosind dou instane ale modulului half-adder creat anterior.
	wire o_w_tmp_sum;
	wire o_w_tmp_carry;
	task0 ha(.o_w_sum(o_w_tmp_sum),
				.o_w_carry(o_w_tmp_carry),
				.i_w_bit_A(i_w_bit_A),
				.i_w_bit_B(i_w_bit_B));
	
	wire o_w_tmp_carry2;
	task0 ha2(.o_w_sum(o_w_sum),
				.o_w_carry(o_w_tmp_carry2),
				.i_w_bit_A(o_w_tmp_sum),
				.i_w_bit_B(i_w_carry_in)
	);
	
	assign o_w_carry_out = o_w_tmp_carry  | o_w_tmp_carry2;

endmodule
