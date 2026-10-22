`timescale 1ns / 1ps
`include "defines.vh"

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ordinator_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task4(
		output wire o_w_digit_point,
		output reg [7:0] o_r_progress,
		output wire [0:6] o_w_segment,
		output wire [3:0] o_w_digit,
		input wire [7:0] i_w_operand,
		input wire i_w_add_button,
		input wire i_w_sub_button,
		input wire i_w_op_button,
		input wire i_w_reset,
		input wire i_w_clk
    );

	localparam STATE_INITIAL = 0;
	localparam STATE_OP1_READ = 1;
	localparam STATE_OP2_READ = 2;
	localparam STATE_RESULT_SELECT = 3;
	
	wire l_w_add_btn_debounced, l_w_sub_btn_debounced, l_w_op_btn_debounced;
	reg current_state;
	reg next_state;
	
	reg[7:0] op1;
	reg[7:0] op2;
	
	reg [9:0] l_r_message;
	// TODO 4.1: Declarai parametri de care avei nevoie
	//		Obs: Se vor declara pe parcurs ce avei nevoie de ei
	wire op_debounced;	
	debouncer db1(op_debounced, i_w_clk, i_w_reset, i_w_op_button);
	
	wire add_debounced;	
	debouncer db2(add_debounced, i_w_clk, i_w_reset, i_w_add_button);
	
	wire sub_debounced;	
	debouncer db3(sub_debounced, i_w_clk, i_w_reset, i_w_sub_button);
	
	// TODO 4.2: Instaniai sumatorul, scztorul i alte module la nevoie 
	wire carry_suma;
	wire[7:0] suma;
	task2 sumator(carry_suma, suma, op1, op2, 0);
	
	wire carry_dif;
	wire[7:0] diferenta;
	task3 subtractor(carry_dif, diferenta, op1, op2, 0);

	display_7_segment_driver l_m_display(
		.o_r_segment(o_w_segment),
		.o_r_digit_point(o_w_digit_point),
		.o_r_digit(o_w_digit),
		.i_w_message(l_r_message),
		.i_w_reset(i_w_reset),
		.i_w_clk(i_w_clk)
	);
	
	reg [31:0] l_r_delay;
    reg [15:0] l_r_count;
	
	always @(posedge i_w_clk) begin
		// TODO 4.3: Implementai logica de tranziie dup ceas
		//				-> reset
		//		end
		if (i_w_reset) begin
            next_state <= STATE_INITIAL;
            l_r_delay <= 0;
            l_r_count <= 0;
        end else begin
            // TODO: Incrementarea contorului.
            // TODO: Intarzierea schimbarii de stare.
				if (op_debounced) begin
					l_r_count <= l_r_count + 1;
				end
				
				
				l_r_delay <= l_r_delay + 1;
				
				if (l_r_delay == 100000) begin
					l_r_delay <= 0;
					current_state <= next_state;
				end
        end
	end
	
	always @(*) begin
		// TODO 4.4: Implementai logica de schimbare a strilor
		case (current_state)
			STATE_INITIAL: begin
				l_r_message = PRESS_MESSAGE;
				next_state = STATE_OP1_READ;
			end
			STATE_OP1_READ : begin
				op1 = i_w_operand;
				l_r_message = {2b'00, op1};
				next_state = STATE_OP2_READ;
			end
			STATE_OP2_READ : begin
				op2 = i_w_operand;
				l_r_message = {2b'00, op2};
				next_state = RESULT_SELECT;
			end
			RESULT_SELECT: begin
				if (add_debounced) begin
					l_r_message = {2b'00, suma}
				end
				if (sub_debounced) begin
					l_r_message = {2b'00, diferenta}
				end
				
				if (~add_debounced | ~sub_debounced)begin
					l_r_message = PRESS_MESSAGE;
				end
			end
	end
	

endmodule
