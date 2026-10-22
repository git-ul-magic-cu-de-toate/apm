`timescale 1ns / 1ps
`include "defines.vh"

module ex3(
	output  reg [7:0]   out,
	input button_debounced,
	input reset,
	input clk
	);

	localparam STATE_INITIAL = 0;
	localparam STATE_T00 = 1;
	localparam STATE_T01 = 2;
	localparam STATE_PLACEHOLDER = 3;

	reg button_pressed;

	//foloseste red/green_counter pentru a monitoriza cat timp
	//s-a asteptat deja din intervalele care intarzie tranzitiile
	reg [31:0]  red_counter;
	reg [31:0]  green_counter;
	reg [1:0]   currentState;
	reg [1:0]   nextState;

	//output-ul acestui task este o serie de 8 becuri a caror aprindere va trebui
	//sa o gestionam. Fiecare dintre aceste becuri e controlat de unul din bitii
	//lui out.

	always @(posedge clk) begin
        //if(reset) begin
        if(reset == 0) begin //TODO for board
            red_counter = 0;
            green_counter = 0;
            currentState = STATE_INITIAL;
            button_pressed = 0;
        end else begin
            case (currentState)
                STATE_INITIAL: begin
                    out = 8'b00000000;
                    nextState = STATE_T00;
                end

                STATE_T00: begin
                    //TODO: aprindeti primele 4 becuri
                    out = 8'b1111_0000;
                    
                    //TODO: inregistrati apasarea butonului (deja debounced)
                    //odata apasat se porneste timer-ul care trebuie sa
                    //astepte intervalul aferent culorii rosii. (vezi defines.vh!)
                    //O apasare ulterioara nu reseteaza timer-ul.
                    //HINT: (foloseste button_pressed)
                    if (button_debounced) begin
                    //if (button_debounced == 0) begin //TODO for board
                        //TODO: vezi mai sus
                        if(!button_pressed) begin
                            button_pressed = 1;
                            red_counter = 0;
                        end
                    end
                    
                    nextState = STATE_T00;
                    if (button_pressed) begin
                        //TODO: vezi mai sus!
                        //HINT: foloseste counter-ele!
                        red_counter = red_counter + 1;
                        if(red_counter == `SMPHR_RED_TMR) begin
                        //if(red_counter[28] == 1) begin // TODO for board
                            nextState = STATE_T01;
                            green_counter = 0;
                        end
                    end
                end
                
                STATE_T01: begin
                    //TODO: aprinde ultimele 4 becuri!
                    out = 8'b0000_1111;
                    
                    //TODO: in starea aceasta nu mai suntem influentati de buton
                    //asa ca trebuie sa resetam flag-ul.
                    button_pressed = 0;
                    
                    //TODO: asteapta timpul aferent culorii verzi a semaforului! (vezi defines.vh)
                    //HINT: foloseste counter-ele!
                    green_counter = green_counter + 1;
                    nextState = STATE_T01;
                    if(green_counter == `SMPHR_GRN_TMR) begin
                    //if(green_counter[26] == 1) begin // TODO for board
                        nextState = STATE_T00;
                    end
                    
                end
                
                STATE_PLACEHOLDER: begin
                    //EROARE
                    //Execution flow-ul nu ar trebui sa ajunga aici niciodata.
                    out = 8'b00000000;
                    nextState = STATE_INITIAL;
                end
                
            endcase
            //Acest bloc always se va ocupa atat de logica output-urilor si de tranzitii
            //cat si de efectuarea tranzitiilor cu delay-urile aferente.
            //(adica imbina blocurile always @(posedge clk) si always @(*) din exercitiile anterioare
            //Treaba voastra este sa setati nextState-ul corect la momentul potrivit, ne ocupam noi de efectuarea tranzitiei.
            currentState = nextState;
        end
	end
endmodule