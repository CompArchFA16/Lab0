// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder4bit (sum, carryout, overflow, a, b);

    initial begin
    // Dump trace to a file. Open with gtkwave.
    //$dumpfile("adder.vcd");
    //$dumpvars;

        // Your test code here
    $display("a3  a2  a1  a0 | b3  b2  b1  b0 | OF  s3  s2  s1  s0  ");
    a=1000; b=1000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], overflow, sum[3], sum[2], sum[1], sum[0]);
    a=1111; b=1111; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], overflow, sum[3], sum[2], sum[1], sum[0]);
    end
endmodule
