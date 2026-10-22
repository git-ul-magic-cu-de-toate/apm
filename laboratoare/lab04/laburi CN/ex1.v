`timescale 1ns / 1ps
`include "defines.vh"
module ex1(
	output  reg   out,
	input reset,
	input clk
	);

	localparam STATE_OFF = 0;
	localparam STATE_ON = 1;

	//folositi registrul "count" pentru a tine evidenta timpului 
	//scurs de la tranzitia in starea curenta pana in prezent.
	reg [31:0]  count;
	reg         currentState;
	reg         nextState;

	always @(posedge clk) begin
		//TODO: Ce se intampla daca user-ul apasa reset in timpul
		//functionarii automatului?
        if(reset) begin
        //if(reset == 0) begin //TODO for board
            count = 0;
            currentState = STATE_OFF;
        end else begin
            count = count + 1;
            if(count == `LED_TMR) begin
            //if(count[26] == 1) begin // TODO: for board
                currentState = nextState;
                count = 0;
            end
        end
		
		// TODO: Tranzitia de la currentState la nextState
		//dupa timpul LED_TMR din defines.vh.
		
	end

	always @(*) begin
		case (currentState)
			// TODO: Pentru fiecare stare stabiliti output-ul (pe model Moore)
			//si tranzitiile in stari ulterioare.
            STATE_OFF : begin
                out = 0;
                nextState = STATE_ON;
            end
            STATE_ON : begin
                out = 1;
                nextState = STATE_OFF;
            end
			
		endcase
	end
endmodule
