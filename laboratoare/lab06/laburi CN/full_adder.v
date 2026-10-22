`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		full_adder
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module full_adder(
		output sum,
		output carry_out,
		input bit_A,
		input bit_B,
		input carry_in
    );
    
    wire l_w_sum0;
    wire l_w_c0;
    wire l_w_c1;
	
	// TODO 1.4: Implementati un full-adder folosind douã instante ale modulului half-adder creat anterior.
    half_adder l_m_ha_0 (.sum(l_w_sum0), .carry(l_w_c0), .bit_A(bit_A), .bit_B(bit_B));
    half_adder l_m_ha_1 (.sum(sum), .carry(l_w_c1), .bit_A(l_w_sum0), .bit_B(carry_in));
    or(carry_out, l_w_c0, l_w_c1);

endmodule
