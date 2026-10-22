`timescale 1ns / 1ps

module task2(
		 output wire [15:0] o_w_sum,
		 output wire o_w_c_out,
		 input wire [15:0] i_w_a,
		 input wire [15:0] i_w_b,
		 input wire i_w_c_in
    );

  
	wire [2:0] l_w_carry;
	// TODO 3: implementati un adder pe 16 de biti (Hint: don't write too much code)
	wire carry[2:0];
	task0 sumator1(o_w_sum[3:0], carry[0], i_w_a[3:0], i_w_b[3:0], i_w_c_in);
	task0 sumator2(o_w_sum[7:4], carry[1], i_w_a[7:4], i_w_b[7:4], carry[0]);
	task0 sumator3(o_w_sum[11:8], carry[2], i_w_a[11:8], i_w_b[11:8], carry[1]);
	task0 sumator4(o_w_sum[15:12], o_w_c_out, i_w_a[15:12], i_w_b[15:12], carry[2]);
	
endmodule
