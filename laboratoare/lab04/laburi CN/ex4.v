module ex4(
	output  reg mutant,
	output  reg [2:0] currentState,
	input       A_debounced,
	input       G_debounced,
	input       C_debounced,
	input       T_debounced,
	input       reset,
	input       clk
	);

	localparam STATE_0 = 0;
	localparam STATE_G = 1;
	localparam STATE_GG = 2;
	//TODO: ce state-uri mai sunt necesare?
	//HINT: vom avea nevoie si de stari pe care nu le vom folosi
	localparam STATE_GGT = 3;
	localparam STATE_GGTC = 4;
	
	

	//Spre deosebire de celelalte FSM-uri din laborator,
	//acesta are scopul de a identifica un pattern.
	//Asadar ne dorim sa inregistram progresul pe care
	//il realizam cu fiecare input care contribuie la 
	//o secventa completa "GGTC".
    
    wire [3:0] in;
    assign in = {A_debounced, G_debounced, C_debounced, T_debounced};
	
	//ATENTIE: FSM-ul trebuie sa fie mereu pregatit sa
	//primeasca input, fie el corect sau gresit.
	//Asadar va trebui sa gestionam corectitudinea
	//secventei primite prin tranzitii in starile potrivite.
	//De asemenea trebuie sa fim mereu pregatiti sa intrerupem
	//sau sa reluam secventa primita

	always @(posedge clk) begin
		if (reset) begin
			currentState <= STATE_0;
			mutant <= 0;
		end
		else begin
			case (currentState)
				STATE_0: begin
					//TODO: tratati fiecare input posibil
					//analizati in functie de ce nucleotida a fost introdusa
					//in ce stare ar trebui sa tranzitionam
					//HINT: verificati *button*_debounced
                    if(in == 4'b0100) begin
                        currentState <= STATE_G;
                    end
                    mutant <= 0;
					
				end

				STATE_G: begin
					//TODO: urmati aceiasi pasi ca la STATE_0
                    if(in == 4'b0100) begin
                        currentState <= STATE_GG;
                    end else begin 
                        if(in == 4'b0000) begin
                            currentState <= STATE_G;
                        end else begin
                            currentState <= STATE_0;
                        end
                    end
                    mutant <= 0;
					
				end

				STATE_GG: begin
					//TODO: urmati aceiasi pasi ca la STATE_0
					if(in == 4'b0100) begin
                        currentState <= STATE_GG;
                    end else begin 
                        if(in == 4'b0001) begin
                            currentState <= STATE_GGT;
                        end else begin
                            if(in == 4'b0000) begin
                                currentState <= STATE_GG;
                            end else begin
                                currentState <= STATE_0;
                            end
                        end
                    end
                    mutant <= 0;
				end

                
				//TODO: aplicati pasii precedenti si pentru
				//starile adaugate de voi
                
                STATE_GGT: begin
					if(in == 4'b0010) begin
                        currentState <= STATE_GGTC;
                        mutant <= 1;
                    end else begin 
                        if(in == 4'b0100) begin
                            currentState <= STATE_G;
                        end else begin
                            if(in == 4'b0000) begin
                                currentState <= STATE_GGT;
                            end else begin
                                currentState <= STATE_0;
                            end
                        end
                        mutant <= 0;
                    end 
				end
                
                STATE_GGTC: begin
					if(in == 4'b0100) begin
                        currentState <= STATE_G;
                        mutant <= 0;
                    end else begin 
                        if(in == 4'b0000) begin
                            currentState <= STATE_GGTC;
                            mutant <= 1;
                        end else begin
                            currentState <= STATE_0;
                            mutant <= 0;
                        end
                    end
				end
				
				
				
			endcase
		end
	end
endmodule