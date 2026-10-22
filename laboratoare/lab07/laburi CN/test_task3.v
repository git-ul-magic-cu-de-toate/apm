`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:35:29 04/14/2022
// Design Name:   task3
// Module Name:   D:/CN1/lab7bis_skel/lab7_skel/test_task3.v
// Project Name:  lab7_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: task3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_task3;

	// Inputs
	reg [3:0] l_w_a;
	reg [3:0] l_w_b;
	reg l_w_c_in;

	// Outputs
	wire [3:0] l_w_sum;
	wire l_w_c_out;

	// Instantiate the Unit Under Test (UUT)
	task3 uut (
		.o_w_sum(l_w_sum), 
		.o_w_c_out(l_w_c_out), 
		.i_w_a(l_w_a), 
		.i_w_b(l_w_b), 
		.i_w_c_in(l_w_c_in)
	);

	initial begin
		// Initialize Inputs
		l_w_a = 0;
		l_w_b = 0;
		l_w_c_in = 0;

		#100;
   	l_w_a = 6;
		l_w_b = 8;
		l_w_c_in = 1;
     
		#100;
   	l_w_a = 1;
		l_w_b = 7;
		l_w_c_in = 1;
		#100;
		$stop;
	end
      
endmodule

