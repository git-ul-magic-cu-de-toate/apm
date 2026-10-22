module mux(output Q, input A, input B, input C, input D, input a, input b);
    wire not_a, not_b;
    wire wA, wB, wC, wD;

    assign not_a = ~a;
    assign not_b = ~b;

    assign wA = A & not_a & not_b;
    assign wB = B & a & not_b;
    assign wC = C & not_a & b;
    assign wD = D & a & b;
    assign Q = ~wA & ~wB & ~wC & ~wD;
endmodule
