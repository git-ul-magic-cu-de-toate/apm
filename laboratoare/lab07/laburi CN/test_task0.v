`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:33 04/14/2022
// Design Name:   task0
// Module Name:   D:/CN1/lab7bis_skel/lab7_skel/test_task0.v
// Project Name:  lab7_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: task0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_task0;

	// Inputs
	reg [3:0] l_r_a;
	reg [3:0] l_r_b;
	reg l_r_c_in;

	// Outputs
	wire [3:0] l_w_sum;
	wire l_w_c_out;

	// Instantiate the Unit Under Test (UUT)
	task0 uut (
		.o_w_sum(l_w_sum), 
		.o_w_c_out(l_w_c_out), 
		.i_w_a(l_r_a), 
		.i_w_b(l_r_b), 
		.i_w_c_in(l_r_c_in)
	);

	initial begin
		// Initialize Inputs
		l_r_a = 0;
		l_r_b = 0;
		l_r_c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		l_r_a = 14;
		l_r_b = 9;
		
		#100;
		
		l_r_a = 1;
		l_r_b = 7;

		#100;
		$stop;
	end
      
endmodule

