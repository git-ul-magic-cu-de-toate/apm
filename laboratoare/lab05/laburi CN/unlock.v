`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:07 03/22/2020 
// Design Name: 
// Module Name:    unlock 
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
module unlock(ascii_in, out, reset, clk
    );
	 output				out;
	 input		[7:0]	ascii_in; // one digit ascii
	 input				reset;
	 input				clk;
	 
	 parameter STATE_INIT   	= 4'b0000,
              STATE_1 			= 4'b0001,
              STATE_2         = 4'b0010,
              STATE_3         = 4'b0011,
              STATE_COUNTER   = 4'b0110,
              STATE_UNLOCK    = 4'b0111,
              STATE_UNLOCK_1    = 4'b1000,
              STATE_UNLOCK_2    = 4'b1001,
              STATE_UNLOCK_3    = 4'b1010;
				  
	 reg  [3:0] 	state;
	 reg  [3:0] 	next_state;
	 reg	[7:0] 	read;
	 reg	[15:0]	time_counter;
	 reg				decrement;
	 reg	[1:0]		fail;
	 reg 				done;
	 reg	[15:0] 	timer;
	 reg timer_reset;
     reg [7:0] password[0:3];
     
     
	 always @(posedge clk) begin
		if (reset) begin
			state = STATE_INIT;
			fail = 0'b00;
            timer_reset = 0;
            decrement = 1;
            password[0] = "A";
            password[1] = "C";
            password[2] = "B";
            password[3] = "D";
		end
		else begin
			// TODO Task 1
			// setare stare urmatoare
            state = next_state;
			
			//TODO Task 2
			// regula de intrare in STATE_COUNTER
			end
	 end
	 
	 always @(*)begin
		if (!reset) begin
			read = ascii_in;
		end
	 end
	 
	 always @(ascii_in) begin	
		next_state = state;
		
		case (state)
		STATE_INIT: begin
			//TODO Task 2
			// coditii pentru greseli
			if (read == password[0]) begin
				next_state = STATE_1;
			end
			else begin
			   next_state = STATE_INIT;
               fail = fail + 1;
               if(fail == 3) begin
                    next_state = STATE_COUNTER;
               end
			end
		end
		STATE_1: begin
			//TODO Task 1
			if (read == password[0]) begin
				//next_state = STATE_1;
                //TAsk 2
                next_state = STATE_INIT;
                fail = fail + 1;
                if(fail == 3) begin
                    next_state = STATE_COUNTER;
               end
			end
			else begin
                if (read == password[1]) begin
                    next_state = STATE_2;
                end
                else begin
                   next_state = STATE_INIT;
                   fail = fail + 1;
                   if(fail == 3) begin
                        next_state = STATE_COUNTER;
                   end
                end
			end
		end
		STATE_2: begin
			//TODO Task 1
			if (read == password[0]) begin
				//next_state = STATE_1;
                //TAsk 2
                next_state = STATE_INIT;
                fail = fail + 1;
                if(fail == 3) begin
                    next_state = STATE_COUNTER;
                end
			end
			else begin
                if (read == password[2]) begin
                    next_state = STATE_3;
                end
                else begin
                    next_state = STATE_INIT;
                   fail = fail + 1;
                   if(fail == 3) begin
                        next_state = STATE_COUNTER;
                   end
                end
			end
		end
		STATE_3: begin
			//TODO Task 1
			if (read == password[0]) begin
				//next_state = STATE_1;
                //TAsk 2
                next_state = STATE_INIT;
                fail = fail + 1;
                if(fail == 3) begin
                    next_state = STATE_COUNTER;
               end
			end
			else begin
                if (read == password[3]) begin
                    next_state = STATE_UNLOCK;
                end
                else begin
                    next_state = STATE_INIT;
                   fail = fail + 1;
                   if(fail == 3) begin
                        next_state = STATE_COUNTER;
                   end
                end
			end
		end
		STATE_COUNTER: begin
			//TODO Task 2
            if((timer_reset == 0) && (fail ==3)) begin
                timer = "03";
                timer_reset = 1;
            end else begin
                timer_reset = 0;
                fail = 0;
                if(done) begin
                    next_state = STATE_INIT;
                end else begin
                    next_state = STATE_COUNTER;
                end
            end
            
		end
		STATE_UNLOCK: begin
			//TODO Task 1
            next_state = STATE_UNLOCK_1;
            password[0] = read;
		end
		STATE_UNLOCK_1: begin
			//TODO Task 1
            next_state = STATE_UNLOCK_2;
            password[1] = read;
		end
		STATE_UNLOCK_2: begin
			//TODO Task 1
            next_state = STATE_UNLOCK_3;
            password[2] = read;
		end
		STATE_UNLOCK_3: begin
			//TODO Task 1
            next_state = STATE_INIT;
            password[3] = read;
		end
		//TODO Task 1 
		//completare stari
		endcase
	end
	
	assign out = (state == STATE_UNLOCK ? 1 : 0);
	counter counter1(.ascii_in(timer), .counter(time_counter), .decrement(decrement), .done(done), .reset(timer_reset), .clock(clk));
	
endmodule
