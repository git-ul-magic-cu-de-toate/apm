`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		subtractor_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module subtractor_8bit(
		output carry_out,
		output [7:0] result,
		input  [7:0] A,
		input  [7:0] B,
		input carry_in
    );

	// TODO 3: Implementati un scãzãtor pe 8 biti folosind sumatorul ripple-carry implementat
	// Conventie: result = A - B
	// Hint: Complement fatã de 2 ~B+1 -> A - B -> A + ~B cu carry_in = 1 -> A+ (~B+1)
    // A-B-C_in - A+~B+1-C_in
    wire [7:0] not_B;
    assign not_B = ~B;
    
    ripple_carry_8bit l_m_rc_0 (.A(A), .B(not_B), .carry_in(~carry_in), .carry_out(carry_out), .sum(result)); 
    
	
endmodule
