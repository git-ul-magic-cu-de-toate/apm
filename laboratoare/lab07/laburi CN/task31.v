`timescale 1ns / 1ps

module task31(
    output wire o_w_S,
    output wire o_w_Cout,
    input wire  i_w_A,
    input wire  i_w_B,
    input wire  i_w_Cin
    );

    wire    l_w_S0;
    wire    l_w_Cout0;
    wire    l_w_Cout1;
    wire #(2) l_w_Cout_delayed;
    assign o_w_Cout = l_w_Cout_delayed;
	 
    half_adder ha0(l_w_S0, l_w_Cout0, i_w_A, i_w_B);
    half_adder ha1(o_w_S, l_w_Cout1, l_w_S0, i_w_Cin);
    or (l_w_Cout_delayed, l_w_Cout0, l_w_Cout1);
endmodule
