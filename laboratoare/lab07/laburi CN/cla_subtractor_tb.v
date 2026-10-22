`timescale 1ns / 1ps
module cla_subtractor_tb;

  /* Make a reset that pulses once. */
    wire [3:0]  l_w_diff;
    wire   l_w_cout;
    reg [3:0]  l_r_a;
    reg [3:0]  l_r_b;

  cla_subtractor l_m_CLA_S_0 (
        .diff(l_w_diff),
        .c_out(l_w_cout),
        .a(l_r_a),
        .b(l_r_b)
    );

  initial begin
     $dumpfile("cla_subtractor_test.vcd");
     $dumpvars;
     
     l_r_a = 4;
     l_r_b = 3;

     #100
     l_r_a = 1;
     l_r_b = 2;

     #100
     $finish;

  end

   initial
     $monitor("At time %t, sum = %h (%0d), cout = %h (%0d)",
              $time, l_w_diff, l_w_diff, l_w_cout, l_w_cout);

endmodule