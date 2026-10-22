`timescale 1ns / 1ps

module task1 (
        output wire [3:0] o_w_diff,
        output wire       o_w_c_out,
        input  wire [3:0] i_w_a,
        input  wire [3:0] i_w_b
    );

    //TODO 2: implemetati logica pentru un scazator carry-lookahead pe 4 biti
	 wire aux;
	task0 sumator(o_w_diff, aux, i_w_a, ~i_w_b, 1);
	assign o_w_c_out = ~aux;
	//1111 - 0001 = 1111 + 1110 + 1 = 10000 
	//1010 - 1000 = 1010 + 0111 + 1 = 1010 + 1000 = 10010
	// 0101 - 1000 = 0101 + 0111 + 1= 0110 + 0111 = 1101
	//(a-b = a + (~b) + 1)
	//-b = 100000
	//~b = 011111 + 1
endmodule

