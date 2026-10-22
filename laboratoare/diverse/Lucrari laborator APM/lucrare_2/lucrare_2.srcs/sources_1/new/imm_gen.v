`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 01:32:14 PM
// Design Name: 
// Module Name: imm_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//module imm_gen(input[31:0] in, output reg[31:0] out );
//integer i;
//always@(in)begin
//    case (in[6:0])
//        7'b1100011:begin //beq, bne, blt, bge ,bltu,bgeu opecode B
//                        out[0] = 0;
//                        out[4:1] = in[11:8];
//                        out[10:5] = in[30:25];
//                        out[11] = in[7];
//                        for ( i=12; i < 32; i = i +1) begin
//                            out[i] = in[31];
//                        end
//                   end
//        7'b0100011:begin //sw opecode S
//                        out[0] = in[7];
//                        out[4:1] = in[11:8];
//                        out[10:5] = in[30:25];
//                        for (i = 11; i < 32; i = i +1) begin
//                            out[i] = in[31];
//                        end
//                   end
//        7'b0010011:
//            begin //addi,andi,ori,xori,slti,sltiu,srli,srai,slli opecode I
//                    case (in[14:12])
//                        3'b001:begin
//                            out[4:0] = in[24:20];
//                            for (i=5; i < 32; i = i +1) begin
//                                out[i] = 1'b0;
//                            end
//                         end
//                        3'b101:begin
//                            out[4:0] = in[24:20];
//                            for (i=5; i < 32; i = i +1) begin
//                                out[i] = 1'b0;
//                            end
//                         end
//                        default:begin
//                            out[0] = in[20];
//                            out[4:1] = in[24:21];
//                            out[10:5] = in[30:25];
//                            for ( i=11; i < 32; i = i +1) begin
//                                out[i] = in[31];
//                            end
//                        end
//                   endcase
//            end
//        7'b0000011:begin //lw opecode I
//                        out[0] = in[20];
//                        out[4:1] = in[24:21];
//                        out[10:5] = in[30:25];
//                        for ( i=11; i < 32; i = i +1) begin
//                            out[i] = in[31];
//                        end
//                    end
//        default: out = 32'b0;  
//    endcase
    
//end

//endmodule


module imm_gen(
    input [31:0] in,
    output reg [31:0] out
    );
    
    wire [9:0] identifier = {in[14:12], in[6:0]};
    
    always @(in)
        begin
            casex(identifier)
                10'b0000010011:  // ADDI
                    out <= {{21{in[31]}}, in[30:20]};
                10'b1110010011:  // ANDI
                    out <= {{21{in[31]}}, in[30:20]};
                10'b1100010011:  // ORI
                    out <= {{21{in[31]}}, in[30:20]};
                10'b1000010011:  // XORI
                    out <= {{21{in[31]}}, in[30:20]};
                10'b0100010011:  // SLTI
                    out <= {{21{in[31]}}, in[30:20]};
                10'b0110010011:  // SLTIU
                    out <= {{21{in[31]}}, in[30:20]};
                10'b1010010011:  // SRLI / SRAI
                    out <= {{27{1'b0}}, in[24:20]};
                10'b0010010011:  // SLLI
                    out <= {{27{1'b0}}, in[24:20]};
                10'bxxx1100011:  // B type
                    out <= {{20{in[31]}}, in[7], in[30:25], in[11:8], 1'b0};
                10'bxxx0100011:  // SW
                    out <= {{21{in[31]}}, in[30:25], in[11:7]};
                10'bxxx0000011:  // LW
                    out <= {{21{in[31]}}, in[30:20]};
                default:
                    out <= 32'b0;
            endcase
        end
    
endmodule
