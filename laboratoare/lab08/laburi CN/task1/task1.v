`timescale 1ns / 1ps
module task1(
    output wire [3:0] o_w_quotient, //Divisor/Devidend
    output wire [3:0] o_w_remainder, //Divisor%Devidend
    input wire [3:0] i_w_divisor, //Divisor  M
    input wire [3:0] i_w_dividend //Devidend Q
);

    //TODO:  Implement division algorithm Booth non-restoring https://www.youtube.com/watch?v=KfBVg8WYOuQ

    reg [7:0] l_r_AQ;
    reg [7:0] l_r_plus_M;
    reg [7:0] l_r_minus_M;

    //TODO calculate -1 * Divisor 
    wire [3:0] l_w_neg_M;
    assign l_w_neg_M = ~i_w_divisor + 1;

    always @(*) begin
        // TODO1: 
        // A = 0; Q = Devidend; M = Divisor
        // calculate R=AQ (concat), plus M, minus M 
        l_r_AQ = {4'b0000, i_w_dividend};
        l_r_plus_M = {i_w_divisor, 4'b0000};
        l_r_minus_M = {l_w_neg_M, 4'b0000};
        // TODO2: repeat the algorithm N times
        repeat(4) begin
            //TODO3: if A < 0 then AQ<-AQ<<1, A<-A+M else AQ<-AQ<<1, A<-A-M
				
				if (l_r_AQ[7] == 1'b1) begin
					l_r_AQ = l_r_AQ <<< 1;
					l_r_AQ = l_r_AQ + l_r_plus_M;
					
					// l_r_AQ = l_r_AQ + l_r_plus_M;
				end else begin
					// l_r_AQ = l_r_AQ + l_r_minus_M;
					l_r_AQ = l_r_AQ <<< 1;
					l_r_AQ = l_r_AQ + l_r_minus_M;
				end
				
            
            //TODO4: if A < 0 then Q[0]<-0 else Q[0]<-1
            if (l_r_AQ[7] == 1'b1) begin
					l_r_AQ[0] = 1'b0;
				end else begin
					l_r_AQ[0] = 1'b1;
				end
            
        end
        
        //TODO5: if A < 0 -> A <- A + M
		  if (l_r_AQ == 1'b1) begin
				l_r_AQ = l_r_AQ + l_r_plus_M;
			end 
        
        
    end

    // TODO6: quotient and remainder
    assign o_w_quotient = l_r_AQ[3:0];
    assign o_w_remainder = l_r_AQ[7:4];
endmodule
