`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ripple_carry_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module ripple_carry_8bit(
		output carry_out,
		output [7:0] sum,
		input  [7:0] A,
		input  [7:0] B,
		input carry_in
    );
	
    wire l_w_carry [0:6];
	// TODO 2: Implementati un sumator ripple-carry pe 8 biti folosind modul full-adder implementat anterior.
	// Hint: buffer pentru transportul din rangul inferior
    full_adder l_m_fa_0 (.sum(sum[0]), .carry_out(l_w_carry[0]), .bit_A(A[0]), .bit_B(B[0]), .carry_in(carry_in));
    full_adder l_m_fa_1 (.sum(sum[1]), .carry_out(l_w_carry[1]), .bit_A(A[1]), .bit_B(B[1]), .carry_in(l_w_carry[0]));
    full_adder l_m_fa_2 (.sum(sum[2]), .carry_out(l_w_carry[2]), .bit_A(A[2]), .bit_B(B[2]), .carry_in(l_w_carry[1]));
    full_adder l_m_fa_3 (.sum(sum[3]), .carry_out(l_w_carry[3]), .bit_A(A[3]), .bit_B(B[3]), .carry_in(l_w_carry[2]));
    full_adder l_m_fa_4 (.sum(sum[4]), .carry_out(l_w_carry[4]), .bit_A(A[4]), .bit_B(B[4]), .carry_in(l_w_carry[3]));
    full_adder l_m_fa_5 (.sum(sum[5]), .carry_out(l_w_carry[5]), .bit_A(A[5]), .bit_B(B[5]), .carry_in(l_w_carry[4]));
    full_adder l_m_fa_6 (.sum(sum[6]), .carry_out(l_w_carry[6]), .bit_A(A[6]), .bit_B(B[6]), .carry_in(l_w_carry[5]));
    full_adder l_m_fa_7 (.sum(sum[7]), .carry_out(carry_out), .bit_A(A[7]), .bit_B(B[7]), .carry_in(l_w_carry[6]));
    
	
endmodule
