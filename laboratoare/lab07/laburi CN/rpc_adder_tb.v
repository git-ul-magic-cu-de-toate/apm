`timescale 1ns / 1ps
module rpc_adder_tb;

  /* Make a reset that pulses once. */
    wire [3:0]  l_w_sum;
    wire   l_w_cout;
    reg [3:0]  l_r_a;
    reg [3:0]  l_r_b;
    reg l_r_c_in;

  rpc_adder l_m_RPC_0 (
        .sum(l_w_sum),
        .c_out(l_w_cout),
        .a(l_r_a),
        .b(l_r_b),
        .c_in(l_r_c_in)
    );

  initial begin
     $dumpfile("rpc_adder_test.vcd");
     $dumpvars;
     
     l_r_a = 4;
     l_r_b = 3;
     l_r_c_in = 0;

     #100
     l_r_c_in = 1;

     #100
     l_r_a = 8;
     l_r_b = 7;

     #100
     $finish;

  end

   initial
     $monitor("At time %t, sum = %h (%0d), cout = %h (%0d)",
              $time, l_w_sum, l_w_sum, l_w_cout, l_w_cout);

endmodule