`timescale 1ns / 1ps
module half_adder(
    output  S,
    output  C,
    input   A,
    input   B
    );

    wire S_in, C_in;
    wire #4 S_delayed = S_in;
    wire #4 C_delayed = C_in;
    assign S = S_delayed;
    assign C = C_delayed;
	 
    xor (S_in, A, B);
    and (C_in, A, B);
endmodule
