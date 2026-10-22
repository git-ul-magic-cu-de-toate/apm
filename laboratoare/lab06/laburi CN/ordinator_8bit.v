`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ordinator_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
///////////////////////////////////////////////////////////////////////////////

module ordinator_8bit(
		output reg [7:0] result,
		output reg		  ready,
		input      [7:0] in,
		input            reset,
		input            clk
);

	localparam FALSE = 2'd0,
				  TRUE  = 2'd1;

	localparam OPERATOR_ADD = 2'd0,
				  OPERATOR_SUB = 2'd1,
				  OPERATOR_EQL = 2'd2,
				  OPERATOR_ERR = 2'd3;

// ----------------------------------------------------------------------------
// TODO 4.1: Codificati starile necesare automatului.
// HINT: Pentru a va fi mai usor, porniti de la implementarea de mai jos.
// ----------------------------------------------------------------------------

	localparam STATE_INITIAL = 4'd0;
	localparam STATE_Wait_F_Operand = 4'd1;
	localparam STATE_Read_F_Operand = 4'd2;
	localparam STATE_Wait_Operator = 4'd3;
	localparam STATE_Read_Operator = 4'd4;
	localparam STATE_Wait_S_Operand = 4'd5;
	localparam STATE_Read_S_Operand = 4'd6;
	localparam STATE_Operation = 4'd7;
	localparam STATE_Result = 4'd8;
	localparam STATE_Error = 4'd9;

	
// ----------------------------------------------------------------------------
// Folositi registrii de mai jos pentru a memora starile
// ----------------------------------------------------------------------------
	reg [3:0] currentState;
	reg [3:0] nextState;
 
// ----------------------------------------------------------------------------
// TODO 4.2: Definiti comportamentul iesirilor
// HINT: Verificati care este rezultatul final in functie de starea curenta
// ----------------------------------------------------------------------------

    reg [7:0] current_result;
    
    always @(*) begin
        if(reset) begin
            result = 0;
            ready = 0;
        end else begin
            ready = 0;
            if(currentState == STATE_Result) begin
                result = current_result;
            end
            if (currentState == STATE_Wait_F_Operand) begin
                ready = 1;
            end
            if (currentState == STATE_Wait_Operator) begin
                ready = 1;
            end
            if (currentState == STATE_Wait_S_Operand) begin
                ready = 1;
            end
        
        end
    end


 
// ----------------------------------------------------------------------------
// TODO 4.3: Definiti mecanismul de tranzitie a starilor
// HINT: Folositi currentState si nextState
// ----------------------------------------------------------------------------

    always @(posedge clk) begin
        if(reset) begin
            currentState = STATE_INITIAL;
        end else begin
            currentState = nextState;
        end
    
    end


// ----------------------------------------------------------------------------
// Definiti comportamentul si modul de schimbare a starilor urmand TODO-urile
// de mai jos
// ----------------------------------------------------------------------------



// ----------------------------------------------------------------------------
// TODO 4.4: Declarati-va variabilele locale de care aveti nevoie in
// implementare
// ----------------------------------------------------------------------------
    reg [1:0] current_operator;
    reg [7:0] current_s_operand; 
    reg [7:0] current_f_operand; 
    wire [7:0] current_sub;
    wire [7:0] current_add;


// ----------------------------------------------------------------------------
// TODO 4.5: Declarati-va modulele implementate anterior de care aveti nevoie
// in implementare.
// ----------------------------------------------------------------------------

    wire add_carry;
    wire sub_carry;
    subtractor_8bit l_m_sub_0 (.result(current_sub), .A(current_f_operand), .B(current_s_operand), .carry_in(1'b0), .carry_out(sub_carry));
    ripple_carry_8bit l_m_add_0 (.sum(current_add), .A(current_f_operand), .B(current_s_operand), .carry_in(1'b0), .carry_out(add_carry));


	always @(*) begin
			// -------------------------------------------------------------------
			// TODO 4.6: Implementati modulul de schimbare a starilor
			// -------------------------------------------------------------------
        case(currentState)
            STATE_INITIAL : begin
                nextState = STATE_Wait_F_Operand;
            end
            
            STATE_Wait_F_Operand : begin
                nextState = STATE_Read_F_Operand;
            end
            
            STATE_Read_F_Operand : begin
                current_result <= in;
                nextState = STATE_Wait_Operator;
            end
            
            STATE_Wait_Operator : begin
                current_f_operand = current_result;
                nextState = STATE_Read_Operator;
            end
            
            STATE_Read_Operator : begin
                current_operator = in;
                if(in > 2) begin
                    nextState = STATE_Wait_Operator;
                end else begin
                    if(in == 2) begin
                        nextState = STATE_Result;
                    end else begin
                        nextState = STATE_Wait_S_Operand;
                    end
                end
            end
            
            STATE_Wait_S_Operand : begin
                nextState = STATE_Read_S_Operand;
            end
            
            STATE_Read_S_Operand : begin
                current_s_operand = in;
                nextState = STATE_Operation;
            end
            
            
            STATE_Operation : begin
                nextState = STATE_Wait_Operator;
                case(current_operator)
                    OPERATOR_ADD: current_result = current_add;
                    OPERATOR_SUB: current_result = current_sub;
                    default: begin
                        current_result = 8'bx;
                        nextState = STATE_Error;
                    end
                endcase
            end
            
            
            STATE_Result : begin
                nextState = STATE_INITIAL;
            end
            
            
            STATE_Error : begin
                nextState = STATE_INITIAL;
            end
            
            default : begin
                nextState = STATE_INITIAL;
            end
            
		endcase
	end
endmodule
