`include "state_machine.vh"
`include "alu_opsel.vh"

module cpu(
	input				reset,
	input				clk
	);

	/*
	 * Processor registers. Rd and Rr refer to registers from this array.
	 */
	reg	[31:0]	  	registers[31:0];
	integer		i;

	
	always @(posedge reset) begin
		for (i = 0; i < 32; i = i + 1) 
		begin
			registers[i] = i;
		end
	end
	
	reg	[7:0]		program_counter;

	/*
	 * These signals don't actually do anything, they are here just for
	 * debugging purposes.
	 */
	reg	[7:0]		program_counter_if;
	reg	[7:0]		program_counter_id;
	reg	[7:0]		program_counter_ex;
	reg	[7:0]		program_counter_mem;
	reg	[7:0]		program_counter_wb;

	always @(program_counter) begin
		/*
		 * TODO 2: Each instruction must be moved to the next stage. The IF stage
		 * must receive a brand new instruction.
		 */
		program_counter_if <= program_counter;
		program_counter_id <= program_counter_if;
		program_counter_ex <= program_counter_id;
		program_counter_mem <= program_counter_ex;
		program_counter_wb <= program_counter_mem;
	end

	/*
	 * TODO 2: This signal links the IF and ID stages. Because we will be
	 * fetching one instruction wile decoding another, we need a buffer for it.
	 */
	wire	[31:0]	instruction;
	reg		[31:0]	instruction_ID;

	memory instruction_memory(
		.data(instruction),
		.address(program_counter),
		.clk(clk)
	);

	/*
	 * TODO 2: These signals link the ID and EX stages. We need buffers for
	 * them.
	 */
	wire	[31:0]	alu_A;
	wire	[31:0]	alu_B;
	wire	[2:0]		alu_opsel;
	wire	[7:0]		alu_address;
	reg	[31:0]	alu_A_EX;
	reg	[31:0]	alu_B_EX;
	reg	[2:0]		alu_opsel_EX;
	reg	[7:0]		alu_address_EX;
	reg	[7:0]		alu_address_MEM;

	/*
	 * TODO 2: We now have a buffer for the instruction signal. Should we send
	 * the unbuffered or buffered value to the decoder?
	 * Hint: In the pipeline, the unbuffered value of the instruction will be
	 * changed by the memory while the decoder is using it because the memory is
	 * fetching a new instruction while the decoder is decoding.
	 */
	 
	wire	[31:0]	op1;
	wire	[31:0]	op2;
	wire	[2:0]		opsel;

	decoder decoder_unit(
		.op1(op1),
		.op2(op2),
		.opsel(opsel),
		.instruction(instruction_ID)
	);

	assign alu_A = (opsel == `OPSEL_AND || opsel == `OPSEL_OR ||
		opsel == `OPSEL_XOR || opsel == `OPSEL_NEG ||
		opsel == `OPSEL_ADD || opsel == `OPSEL_SUB) ?
		registers[op1] : op1;
	assign alu_B = (opsel == `OPSEL_AND || opsel == `OPSEL_OR ||
		opsel == `OPSEL_XOR || opsel == `OPSEL_NEG ||
		opsel == `OPSEL_ADD || opsel == `OPSEL_SUB) ?
		registers[op2] : op2;
	assign alu_opsel = opsel;
	assign alu_address = op1[7:0];


	/*
	 * TODO 2: These signals link the EX and MEM stages. We need buffers for
	 * them.
	 */
	wire	[7:0]		mem_address;
	wire	[31:0]	mem_value;
	reg	[7:0]		mem_address_WB;
	reg	[31:0]	mem_value_WB;

	/*
	 * TODO 2: We now have buffers for the alu_A, alu_B and alu_opsel signals.
	 * Should we send the unbuffered or buffered values to the ALU?
	 */
	wire	[31:0]	alu_R;
	reg	[31:0]	alu_R_MEM;
	alu execution_unit(
		.R(alu_R),
		.A(alu_A_EX),
		.B(alu_B_EX),
		.opsel(alu_opsel_EX)
	);

	/*
	 * TODO 2: We now have a buffer for the alu_address signal. Should we send
	 * the unbuffered or buffered value to the memory?
	 */
	assign mem_address = alu_address_MEM;
	assign mem_value = alu_R_MEM;

	/*
	 * TODO 2: These signals link the MEM and WB stages. We need buffers for
	 * them.
	 */
	wire	[7:0]		wb_address;
	wire	[31:0]	wb_value;

	/*
	 * As we don't have a memory, this is indeed everything the MEM stage does.
	 *
	 * TODO 2: We now have buffers for the mem_address and mem_value signals.
	 * Should we send the unbuffered or buffered values to be written back to
	 * registers?
	 */
	assign wb_address = mem_address_WB;
	assign wb_value = mem_value_WB;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			program_counter <= 0;
		end else begin
			/*
			 * TODO 2: We need a new instruction every clock cycle.
			 */
			program_counter <= (program_counter + 1);

			/*
			 * TODO 2: Each stage's output must be moved to the next stage's input
			 * buffer (see the buffers you created above).
			 */
			instruction_ID <= instruction;
			alu_A_EX <= alu_A;
			alu_B_EX <= alu_B;
			alu_opsel_EX <= alu_opsel;
			alu_address_EX <= alu_address;
			alu_address_MEM <= alu_address_EX;
			alu_R_MEM <= alu_R;
			mem_address_WB <= mem_address;
			mem_value_WB <= mem_value;
			if (wb_address !== 8'hxx) begin
					registers[wb_address] <= wb_value;
			end
		end
	end

endmodule
