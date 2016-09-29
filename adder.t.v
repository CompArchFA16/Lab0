// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;

    reg[8:0] i; //counting thru forloop

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder4bit (sum, carryout, overflow, a, b);

    initial begin
    // Dump trace to a file. Open with gtkwave.
    $dumpfile("adder.vcd");
    $dumpvars;

        // Your test code here
    $display("a3  a2  a1  a0 | b3  b2  b1  b0 | CO  s3  s2  s1  s0  | OF");
    // for (i=8'b00000000; i<=8'b11111111; i=i+1) begin
    //     a=i[7:4]; b=i[3:0]; #1000 
    //     $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    // end
    a=4'b1111; b=4'b1111; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b1011; b=4'b1011; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b1110; b=4'b1100; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b1111; b=4'b1000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0011; b=4'b0011; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0101; b=4'b0101; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0001; b=4'b0010; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0111; b=4'b0010; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0001; b=4'b1000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0001; b=4'b1111; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0111; b=4'b1001; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0000; b=4'b0000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0000; b=4'b1111; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0000; b=4'b0111; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b1111; b=4'b0000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);
    a=4'b0111; b=4'b0000; #1000 
    $display("%b   %b   %b   %b  | %b   %b   %b   %b  | %b   %b   %b   %b   %b   | %b  ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], carryout, sum[3], sum[2], sum[1], sum[0], overflow);

    end
endmodule
