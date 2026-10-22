`timescale 1ns / 1ps

module task3(
        output wire  [3:0] o_w_sum,
        output wire       o_w_c_out,
        input wire   [3:0] i_w_a,
        input wire  [3:0] i_w_b,
        input wire     i_w_c_in
    );
	

	// TODO 4: Implementa?i un sumator ripple-carry pe 4 bi?i
	wire carry[2:0];
	task31 fa1(o_w_sum[0], carry[0], i_w_a[0], i_w_b[0], i_w_c_in);
	task31 fa2(o_w_sum[1], carry[1], i_w_a[1], i_w_b[1], carry[0]);
	task31 fa3(o_w_sum[2], carry[2], i_w_a[2], i_w_b[2], carry[1]);
	task31 fa4(o_w_sum[3], o_w_c_out, i_w_a[3], i_w_b[3], carry[2]);
	
endmodule
