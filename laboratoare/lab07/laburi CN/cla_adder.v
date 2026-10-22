`timescale 1ns / 1ps

module cla_adder (
        output  [3:0] sum,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b,
        input         c_in
    );

	//TODO 1: implemetati logica unui sumator carry-lookahead pe 4 biti
	wire [3:0] carry_la;
	wire [3:0] P, G;

	wire [3:0] carry_la_in;
	wire [3:0] P_in, G_in;

	wire #4 P_delay_0 = P_in[0];
	wire #4 P_delay_1 = P_in[1];
	wire #4 P_delay_2 = P_in[2];
	wire #4 P_delay_3 = P_in[3];
    wire #4 G_delay_0 = G_in[0];
    wire #4 G_delay_1 = G_in[1];
    wire #4 G_delay_2 = G_in[2];
    wire #4 G_delay_3 = G_in[3];
	wire #4 carry_la_delay_0 = carry_la_in[0];
	wire #4 carry_la_delay_1 = carry_la_in[1];
	wire #4 carry_la_delay_2 = carry_la_in[2];
	wire #4 carry_la_delay_3 = carry_la_in[3];

    assign P = {P_delay_3,P_delay_2,P_delay_1,P_delay_0};
    assign G = {G_delay_3,G_delay_2,G_delay_1,G_delay_0};
    assign carry_la = {carry_la_delay_3,carry_la_delay_2,carry_la_delay_1,carry_la_delay_0};

    assign P_in = a ^ b;
    assign G_in = a & b;

    assign carry_la_in[0] = G[0] | (P[0] & c_in);
    assign carry_la_in[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
    assign carry_la_in[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
    assign carry_la_in[3] = G[3] | (P[2] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in);

    assign c_out = carry_la[3];
    assign sum = P ^ {carry_la[2:0], c_in};
	
endmodule

