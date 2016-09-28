//For each device, first write a test bench that verifies the appropriate behavior of your device. We have already completed this for you for the 2 bit decoder as an //example, so you will only have to write the other two.

//The test bench should:

//Instantiate a copy of the device it is testing (Device Under Test = DUT)
//Show what the truth table should be
//Show what the truth table is

// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    //reg a, b, carryin;
    reg[3:0] a, b;
    //wire sum, carryout;
    wire[3:0] sum;
    wire carryout, overflow;

    //toggle between these to test different modules found in adder.v
    //behavioralFullAdder adder(sum, carryout, a, b, carryin);
    //structuralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder(sum, carryout, overflow, a, b);

    initial begin
    $dumpfile("adder.vcd"); //for gtkwave waveform analysis
    $dumpvars;

    //Show results for four types of testing with 4 examples each: 4bit addition of positive and positive numbers (without overflow), 
    //negative and negative numbers (without overflow), positive and negative numbers and cases specifically
    //planned to overflow (2 positive-positive addition and 2 negative-negative addition)
    $display("A      B    | Cout  Sum  Overflow | Expected Output");
    $display("Positive + Positive, no overflow");
    a=4'b0000;b=4'b0001; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 0001, 0    ", a, b, carryout, sum, overflow);

    a=4'b0100;b=4'b0010; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 0110, 0    ", a, b, carryout, sum, overflow);

    a=4'b0101;b=4'b0001; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 0110, 0    ", a, b, carryout, sum, overflow);

    a=4'b0010;b=4'b0011; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 0101, 0    ", a, b, carryout, sum, overflow);

    $display("Negative + Negative, no overflow");
    a=4'b1110;b=4'b1100; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 1010, 0    ", a, b, carryout, sum, overflow);

    a=4'b1001;b=4'b1111; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 1000, 0    ", a, b, carryout, sum, overflow);

    a=4'b1101;b=4'b1100; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 1001, 0    ", a, b, carryout, sum, overflow);

    a=4'b1100;b=4'b1111; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 1011, 0    ", a, b, carryout, sum, overflow);

    $display("Positive + Negative, no overflow");
    a=4'b0011;b=4'b1100; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 1111, 0    ", a, b, carryout, sum, overflow);

    a=4'b0111;b=4'b1110; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 0101, 0    ", a, b, carryout, sum, overflow);

    a=4'b1010;b=4'b0001; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 1011, 0    ", a, b, carryout, sum, overflow);

    a=4'b0101;b=4'b1000; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 1101, 0    ", a, b, carryout, sum, overflow);

    $display("Overflow");
    a=4'b0111;b=4'b0110; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 1101, 1    ", a, b, carryout, sum, overflow);

    a=4'b0101;b=4'b0100; #1000
    $display("%b  %b  |  %b    %b   %b      |    0, 1001, 1    ", a, b, carryout, sum, overflow);

    a=4'b1001;b=4'b1010; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 0011, 1    ", a, b, carryout, sum, overflow);

    a=4'b1101;b=4'b1000; #1000
    $display("%b  %b  |  %b    %b   %b      |    1, 0101, 1    ", a, b, carryout, sum, overflow);

    end

endmodule
