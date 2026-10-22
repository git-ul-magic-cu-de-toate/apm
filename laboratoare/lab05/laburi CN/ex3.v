module ex3(
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
    input      i_w_button,
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

    reg [15:0] l_r_count;
	 
	 wire button_debounced;	
	 debouncer db(button_debounced, i_w_clk, i_w_reset, i_w_button);

    always @(posedge i_w_clk) begin
        if (i_w_reset) begin
            l_r_next_state <= STATE_0;
            l_r_delay <= 0;
            l_r_count <= 0;
        end else begin
            // TODO: Incrementarea contorului.
            // TODO: Intarzierea schimbarii de stare.
				if (button_debounced) begin
					l_r_count <= l_r_count + 1;
				end
				
				
				l_r_delay <= l_r_delay + 1;
				
				if (l_r_delay == 100000) begin
					l_r_delay <= 0;
					l_r_next_state <= l_r_next_state;
				end
        end
    end

    always @(*) begin
        case (l_r_current_state)
            STATE_0: begin
					l_r_next_state = STATE_3;
					o_r_AN0 = 0;
					o_r_AN1 = 1;
					o_r_AN2 = 1;
					o_r_AN3 = 1;
					
					// reg [15:0]tmp = l_r_count % 10;
					show_digit(l_r_count % 10);
					
					end
				STATE_1: begin
					l_r_next_state = STATE_0;
					o_r_AN0 = 1;
					o_r_AN1 = 0;
					o_r_AN2 = 1;
					o_r_AN3 = 1;
					
					//reg [15:0]tmp = (l_r_count / 10) % 10;
					show_digit((l_r_count / 10) % 10);
					end
				STATE_2: begin
					l_r_next_state = STATE_1;
					o_r_AN0 = 1;
					o_r_AN1 = 1;
					o_r_AN2 = 0;
					o_r_AN3 = 1;
					//reg [15:0]tmp = (l_r_count / 100) % 10;
					show_digit((l_r_count / 100) % 10);
					end
				STATE_3: begin
					l_r_next_state = STATE_2;
					o_r_AN0 = 1;
					o_r_AN1 = 1;
					o_r_AN2 = 1;
					o_r_AN3 = 0;
					// reg [15:0]tmp = (l_r_count / 1000) % 10;
					show_digit((l_r_count / 1000) % 10);
					end
        endcase
    end
	 
	 task show_digit;
         input [3:0] digit;
         begin
             case (digit)
					0: begin
						o_r_CA = 0;
						o_r_CB = 0;
						o_r_CC = 0;
						o_r_CD = 0;
						o_r_CE = 0;
						o_r_CF = 0;
						o_r_CG = 1;
						o_r_DP = 1;
					end
					1: begin
						o_r_CA = 1;
						o_r_CB = 0;
						o_r_CC = 0;
						o_r_CD = 1;
						o_r_CE = 1;
						o_r_CF = 1;
						o_r_CG = 1;
						o_r_DP = 1;
					end
					2: begin
						o_r_CA = 0;
						o_r_CB = 0;
						o_r_CC = 1;
						o_r_CD = 0;
						o_r_CE = 0;
						o_r_CF = 1;
						o_r_CG = 0;
						o_r_DP = 1;
					end
					3: begin
						o_r_CA = 0;
						o_r_CB = 0;
						o_r_CC = 0;
						o_r_CD = 0;
						o_r_CE = 1;
						o_r_CF = 1;
						o_r_CG = 0;
						o_r_DP = 1;
					end
					default: begin
						o_r_CA = 0;
						o_r_CB = 1;
						o_r_CC = 1;
						o_r_CD = 0;
						o_r_CE = 1;
						o_r_CF = 1;
						o_r_CG = 0;
						o_r_DP = 1;
					end
					
				 endcase
         end
    endtask
endmodule
