`include "defines.vh"
module subtractor(
        output  [7: 0]  D,
        input   [3: 0]  A,
        input   [3: 0]  B
    );
	
    wire [3:0] not_B;
    wire [3:0] neg_B;

	// TODO: implement a subtractor
    assign not_B = ~B;
    adder l_m_adder_0(
        .S(neg_B),
        .A(not_B),
        .B(4'b0001)
    );
    adder l_m_adder_1(
        .S(D),
        .A(A),
        .B(neg_B)
    );

endmodule
