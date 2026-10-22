`include "defines.vh"
module multiplier(
        output  [7: 0]  out,
        input   [3: 0]  M,
        input   [3: 0]  R
    );
    //  Implement Booth's algorithm

    wire [3:0] not_M;
    wire [3:0] neg_M;
    wire [7:0] aux_neg_M;

    assign not_M = ~M;

    // TODO: "neg_M = not_M + 1" using adder
    adder l_m_adder_0(
        .S(aux_neg_M),
        .A(not_M),
        .B(4'b0001)
    );

    assign neg_M = aux_neg_M[3:0];

    reg [8:0] P;
    reg [8:0] A;
    reg [8:0] S;

    always @(*) begin
        // TODO: calculate P,A and S
        P = {4'b0000, R, 1'b0};
        A = {M, 5'b0000};
        S = {neg_M, 5'b0000};
        repeat(4) begin
            case (P[1:0])
            2'b00 : P = P;
            2'b01 : P = P + A;
            2'b10 : P = P + S;
            2'b11 : P = P;
            default : P = P;
            endcase
            P = $signed(P) >>> 1;
        end
    end

    // TODO: assign in out the product of M and R
    assign out = P[8:1];

endmodule
