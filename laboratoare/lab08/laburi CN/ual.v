module ual(
        output  [7: 0]  out,
        input   [3: 0]  in0,
        input   [3: 0]  in1,
        input   [4: 0]  sel
    );

    wire    [7: 0]  out_nander;
    wire    [7: 0]  out_xorer;
    wire    [7: 0]  out_adder;
    wire    [7: 0]  out_subtractor;
    wire    [7: 0]  out_multiplier;

    //assign out_nander = // TODO use operators: and, not to implement NAND
    //assign out_xorer = // TODO use XOR operator
    assign out_nander = {4'b0000, ~(in0 & in1)};
    //assign out_nander = {3'b000, (~(in0 & in1) == 0), ~(in0 & in1)};
    assign out_xorer = {4'b0000, in0 ^ in1};
    //assign out_xorer = {3'b000, ((in0 ^ in1) == 0), in0 ^ in1};
    // TODO use adder and put the result in out_adder
    adder l_m_adder_0(
        .S(out_adder),
        .A(in0),
        .B(in1)
    );
    // TODO use subtractor and put the result in out_subtractor
    subtractor l_m_subtractor_0(
        .D(out_subtractor),
        .A(in0),
        .B(in1)
    );
    // TODO use multiplier and put the result in out_multiplier
    multiplier l_m_multiplier_0(
        .out(out_multiplier),
        .M(in0),
        .R(in1)
    );
    // sel == 1 => NAND
    // sel == 2 => XOR
    // sel == 4 => ADD
    // sel == 8 => SUB
    // sel == 16 => MUL

    // TODO: use "?:"
    assign out = (sel == 1) ? out_nander : (
                    (sel == 2) ? out_xorer : (
                        (sel == 4) ? out_adder : (
                            (sel == 8) ? out_subtractor : (
                                (sel == 16) ? out_multiplier : 8'bx
                            )
                        )
                    )
                );

endmodule
