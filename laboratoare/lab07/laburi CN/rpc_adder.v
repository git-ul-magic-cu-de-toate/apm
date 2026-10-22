`timescale 1ns / 1ps

module rpc_adder(
        output  [3:0] sum,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b,
        input         c_in
    );
	
    //TODO 4: implemetati logica pentru un sumator ripple-carry pe 4 biti
    wire [3:0] carry_la;
	full_adder l_m_fa_0(
    .S(sum[0]),
    .Cout(carry_la[0]),
    .A(a[0]),
    .B(b[0]),
    .Cin(c_in)
    );
	full_adder l_m_fa_1(
    .S(sum[1]),
    .Cout(carry_la[1]),
    .A(a[1]),
    .B(b[1]),
    .Cin(carry_la[0])
    );
	full_adder l_m_fa_2(
    .S(sum[2]),
    .Cout(carry_la[2]),
    .A(a[2]),
    .B(b[2]),
    .Cin(carry_la[1])
    );
	full_adder l_m_fa_3(
    .S(sum[3]),
    .Cout(carry_la[3]),
    .A(a[3]),
    .B(b[3]),
    .Cin(carry_la[2])
    );

    assign c_out = carry_la[3];
endmodule
