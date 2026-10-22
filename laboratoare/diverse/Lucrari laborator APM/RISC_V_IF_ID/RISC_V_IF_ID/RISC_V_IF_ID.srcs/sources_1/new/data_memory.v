module data_memory(input clk,       
                   input mem_read,
                   input mem_write,
                   input [31:0] address,
                   input [31:0] write_data,
                   output reg [31:0] read_data);
    reg [31:0] memData [0:1023];
    integer i;
    
    // initializare cu 0
    initial begin
        for (i = 0; i< 1024; i = i + 1) begin 
            memData[i] = 32'b0; 
        end
    end 
     
    // scriere data
    always@(posedge clk) begin
        if(mem_write)
          memData[address[11:2]] <= write_data;
    end
    
    // citire data
    always@(*)
    begin
      if (mem_read == 1) 
          read_data <= memData[address[11:2]];
    end
    
    
endmodule