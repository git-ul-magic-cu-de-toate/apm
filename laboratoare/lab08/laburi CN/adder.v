`include "defines.vh"
module adder(
        output  [7: 0]  S,
        input   [3: 0]  A,
        input   [3: 0]  B
    );
	
	// TODO: Implement a carry look-ahead adder
	wire [3:0] carry_la;
	wire [3:0] P, G;

    assign P = A ^ B;
    assign G = A & B;

    assign carry_la[0] = G[0] | (P[0] & 1'b0);
    assign carry_la[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & 1'b0);
    assign carry_la[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & 1'b0);
    assign carry_la[3] = G[3] | (P[2] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & 1'b0);

    wire c_out;
    assign c_out = carry_la[3];
    wire [3:0] sum;
    assign sum = P ^ {carry_la[2:0], 1'b0};
    wire ov;
    assign ov = (A[3] == B[3]) & (A[3] != sum[3]);
    assign S = {4'b0000, sum};
    //assign S = {ov, sum[3], c_out, (sum == 0), sum};
endmodule
