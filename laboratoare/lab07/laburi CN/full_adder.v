`timescale 1ns / 1ps

module full_adder(
    output  S,
    output  Cout,
    input   A,
    input   B,
    input   Cin
    );

    wire    S0;
    wire    Cout0;
    wire    Cout1;
    wire    Cout_in;
    wire #4 Cout_delayed = Cout_in;
    assign Cout = Cout_delayed;
	 
    half_adder ha0(S0, Cout0, A, B);
    half_adder ha1(S, Cout1, S0, Cin);
    or (Cout_in, Cout0, Cout1);
    
endmodule
