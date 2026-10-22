`timescale 1ns / 1ps
module task2(
    output wire[7:0] o_w_result,
    input wire[3:0] i_w_a,
    input wire[3:0] i_w_b,
    input wire[2:0] i_w_op_sel
);

    //TODO1: define local wire and use task0 and task1 for MUL, DIV and MOD
    wire[7:0] l_w_mul;
    wire[3:0] l_w_div;
    wire[3:0] l_w_mod;
	 
	 

    //TODO2: define a result reg and implement the logic to run the operation from op_sel on a and b
    reg[7:0] l_r_result;
	 
	 reg[7:0] tmp1;
	 reg[7:0] tmp2;
	 task0 mul(tmp1, i_w_a, i_w_b);
	 task0 div(tmp2, i_w_a, i_w_b);

    always @(*) begin
        case(i_w_op_sel)
            //AND
            3'd0: l_r_result = {4'b0000, i_w_a & i_w_b};
            //XOR
            3'd1: l_r_result = {4'b0000, i_w_a ^ i_w_b};
            //OR
            3'd2: l_r_result = {4'b0000,  i_w_a | i_w_b};
            //ADD use opeartor +
            3'd3: l_r_result = {4'b0000, i_w_a + i_w_b};
            //SUB use operator -
            3'd4: l_r_result = {4'b0000, i_w_a - i_w_b};
            //MUL use result from task0
            3'd5: l_r_result = tmp1;
            //DIV use result from task1
            3'd6: l_r_result = {4'b0000, tmp2[3:0]};
            //MOD use result from task1
            3'd7: l_r_result = {4'b0000, tmp2[7:4]};
            default: l_r_result = 8'd0;
        endcase
    end


    //TODO3: assign o_w_result to result
    assign o_w_result = l_r_result;
endmodule