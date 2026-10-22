`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:33 04/14/2022
// Design Name:   task1
// Module Name:   D:/CN1/lab7bis_skel/lab7_skel/test_task1.v
// Project Name:  lab7_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: task1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_task1;

	// Inputs
	reg [3:0] l_r_a;
	reg [3:0] l_r_b;

	// Outputs
	wire [3:0] l_w_diff;
	wire l_w_c_out;

	// Instantiate the Unit Under Test (UUT)
	task1 uut (
		.o_w_diff(l_w_diff), 
		.o_w_c_out(l_w_c_out), 
		.i_w_a(l_r_a), 
		.i_w_b(l_r_b)
	);

	initial begin
		// Initialize Inputs
		l_r_a = 0;
		l_r_b = 0;

		#100;
   
		l_r_a = 10;
		l_r_b = 3;
	
		#100;
   
		l_r_a = 15;
		l_r_b = 1;
		
		#100;
		l_r_a = 5;
		l_r_b = 8;
	
		#100;
		$stop;
	end
      
endmodule

