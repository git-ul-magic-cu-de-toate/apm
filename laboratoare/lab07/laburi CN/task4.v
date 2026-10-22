`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:24:33 04/04/2019 
// Design Name: 
// Module Name:    adder_subtractor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module task4(
		output wire o_w_digit_point,
		output wire [0:6] o_w_segment,
		output wire [3:0] o_w_digit,
		output reg [7:0] o_r_leds,
		input wire [3:0] i_w_operand1,
		input wire [3:0] i_w_operand2,
		input wire i_w_add_button,
		input wire i_w_sub_button,
		input wire i_w_op_ready_button,
		input wire i_w_reset,
		input wire i_w_clk
    );
	 
	localparam STATE_0 = 0;
	localparam STATE_1 = 1;
	localparam STATE_2 = 2;
	localparam STATE_3 = 3;
	
	// variabile pentru debounce
	wire l_w_add_btn_debounced, l_w_sub_btn_debounced, l_w_op_ready_btn_debounced;

	// todo - initializare debouncere
	debouncer dbadd(l_w_add_btn_debounced, i_w_add_button, i_w_clk, i_w_reset, 4);
	debouncer dbsub(l_w_sub_btn_debounced, i_w_sub_button, i_w_clk, i_w_reset, 4);
	debouncer dbrdy(l_w_op_ready_btn_debounced, i_w_op_ready_button, i_w_clk, i_w_reset, 4);

	reg [9:0] l_r_message;
	wire [7:0] l_w_sum;
	wire [7:0] l_w_dif;
	wire l_w_sum_carry, l_w_dif_carry;
	
	reg [3:0] l_r_A;
	reg [3:0] l_r_B;
	
	reg [1:0] l_r_current_state;
	reg [1:0] l_r_next_state;
	
	// pentru fiecare buton se verifica daca a fost apasat
	reg l_r_op_ready_button_pressed, l_r_add_button_pressed, l_r_sub_button_pressed;

	
	// 7 segment display
	display_7_segment_driver display(
		.o_r_segment(o_w_segment),
		.o_r_digit_point(o_w_digit_point),
		.o_r_digit(o_w_digit),
		.i_w_message(l_r_message),
		.i_w_reset(i_w_reset),
		.i_w_clk(i_w_clk)
	);
	
	wire    [3:0]   l_w_S;
	wire l_w_Cout1, l_w_Cout2;
	wire    [3:0]   l_w_D;
	
	// initializati sumatoare si diferentiatoare
	wire tmp_carry_sum;
	wire tmp_carry_dif;
	wire    [3:0]    tmpsum;
	wire    [3:0]    tmpdif;
	task0 sumator(tmpsum, tmp_carry_sum, i_w_operand1, i_w_operand2, 0);
	task1 diferentiator(tmpdif, tmp_carry_dif, i_w_operand1, i_w_operand2, 0);
	
		// implementati modul de functionare
		// al automatului
		always @(posedge i_w_clk) begin
			
			if (i_w_reset) begin
				
			end else begin
				
			end
		end
		
		
		// implementati logica de tranzitie a starilor
		always @(*) begin
		l_r_message = `MESSAGE_DEFAULT;
		
		case (l_r_current_state)
			STATE_0: begin
				l_r_message = `MESSAGE_DEFAULT;
				if (l_r_op_ready_button_pressed) begin
					o_r_leds[7:4] = i_w_operand1;
					o_r_leds[3:0] = i_w_operand2;
					if (l_r_add_button_pressed) begin
						l_r_next_state = STATE_1;
					end
					if (l_r_sub_button_pressed) begin
						l_r_next_state = STATE_2;
					end
				end
			end
			
			STATE_1: begin
				if (l_r_sub_button_pressed) begin
					l_r_next_state = STATE_2;
				end else begin
					l_r_message = tmpsum;
				end
			end
			
			STATE_2: begin

			end
			
			default: begin
				l_r_message = `MESSAGE_ERROR;
				l_r_next_state = `STATE_ERROR;
			end
		endcase
	end
endmodule
