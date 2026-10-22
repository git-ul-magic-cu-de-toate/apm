module ex2(
    output reg o_r_AN0,
    output reg o_r_AN1,
    output reg o_r_AN2,
    output reg o_r_AN3,
    output reg o_r_CA,
    output reg o_r_CB,
    output reg o_r_CC,
    output reg o_r_CD,
    output reg o_r_CE,
    output reg o_r_CF,
    output reg o_r_CG,
    output reg o_r_DP,
    input      i_w_reset,
    input      i_w_clk
    );

    localparam STATE_0 = 0;
    localparam STATE_1 = 1;
    localparam STATE_2 = 2;
    localparam STATE_3 = 3;

    reg [1:0]  l_r_current_state;
    reg [1:0]  l_r_next_state;

    reg [31:0] l_r_delay;

    always @(posedge i_w_clk) begin
        if (i_w_reset) begin
            l_r_current_state <= STATE_0;
            l_r_delay <= 0;
        end else begin
            // TODO: Intarzierea schimbarii de stare.
				l_r_delay <= l_r_delay + 1;
				
				if (l_r_delay == 100000) begin
					l_r_delay <= 0;
					l_r_current_state <= l_r_next_state;
				end
				
        end
    end

    always @(*) begin
        case (l_r_current_state)
            STATE_0: begin
					o_r_AN0 = 0;
					o_r_AN1 = 1;
					o_r_AN2 = 1;
					o_r_AN3 = 1;
					
					o_r_CA = 0;
					o_r_CB = 0;
					o_r_CC = 0;
					o_r_CD = 0;
					o_r_CE = 1;
					o_r_CF = 1;
					o_r_CG = 0;
					o_r_DP = 1;
					
					l_r_next_state = STATE_3;
					end
				STATE_1: begin
					o_r_AN0 = 1;
					o_r_AN1 = 0;
					o_r_AN2 = 1;
					o_r_AN3 = 1;
					
					o_r_CA = 0;
					o_r_CB = 0;
					o_r_CC = 1;
					o_r_CD = 0;
					o_r_CE = 0;
					o_r_CF = 1;
					o_r_CG = 0;
					o_r_DP = 1;
					
					
					l_r_next_state = STATE_0;
					end
				STATE_2: begin
					o_r_AN0 = 1;
					o_r_AN1 = 1;
					o_r_AN2 = 0;
					o_r_AN3 = 1;
					
					o_r_CA = 1;
					o_r_CB = 0;
					o_r_CC = 0;
					o_r_CD = 1;
					o_r_CE = 1;
					o_r_CF = 1;
					o_r_CG = 1;
					o_r_DP = 1;
					
					
					l_r_next_state = STATE_1;
					end
				STATE_3: begin
					o_r_AN0 = 1;
					o_r_AN1 = 1;
					o_r_AN2 = 1;
					o_r_AN3 = 0;
					
					o_r_CA = 0;
					o_r_CB = 0;
					o_r_CC = 0;
					o_r_CD = 0;
					o_r_CE = 0;
					o_r_CF = 0;
					o_r_CG = 1;
					o_r_DP = 1;
					
					l_r_next_state = STATE_2;
					end
        endcase
    end
endmodule
