`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		half_adder_procedural 
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module half_adder_procedural(
		output reg sum,
		output reg carry,
		input bit_A,
		input bit_B
    );

	// TODO 1.3: Implementati un half-adder utilizând descrierea la nivel procedural
    always @(*) begin
        sum <= bit_A ^ bit_B;
        carry <= bit_A & bit_B;
    end
endmodule
