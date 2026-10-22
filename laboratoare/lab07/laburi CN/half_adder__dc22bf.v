`timescale 1ns / 1ps
module half_adder(
    output wire o_w_S,
    output wire o_w_C,
    input  wire i_w_A,
    input  wire i_w_B
    );

    wire #4 l_w_S_delayed, l_w_C_delayed;
    assign o_w_S = l_w_S_delayed;
    assign o_w_C = l_w_C_delayed;
	 
    xor (l_w_S_delayed, i_w_A, i_w_B);
    and (l_w_C_delayed, i_w_A, i_w_B);
endmodule
