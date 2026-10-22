`timescale 1ns / 1ps

module cla_subtractor (
        output  [3:0] diff,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b
    );

    //TODO 2: implemetati logica pentru un scazator carry-lookahead pe 4 biti
	 cla_adder l_m_cla_0 (
        .sum(diff),
        .c_out(c_out),
        .a(a),
        .b(~b),
        .c_in(1'b1)
    );
endmodule

