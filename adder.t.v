// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

// module testFullAdder() ;
//     reg a, b, carryin;
//     wire sum, carryout;
//
//     structuralFullAdder adder (sum, carryout, a, b, carryin);
//
//
//     initial begin
//     $dumpfile("adder.vcd");
//     $dumpvars(0, testFullAdder);
//
//     $display("A B Carryin | Sum Carryout | Expected Output");
//     a=0;b=0;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  0", a, b, carryin, sum, carryout);
//     a=0;b=0;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=0;b=1;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=0;b=1;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=0;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=1;b=0;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=1;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=1;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  1", a, b, carryin, sum, carryout);
//     end
// endmodule

module testFourBit();
    reg carryin;
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout0, carryout1, carryout2, carryout;

    FullAdder4bit fouradder (sum, carryout, overflow, a, b);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, testFourBit);

    $display("   A   B   |  Sum   Carryout   |  Overflow  | Expected Sum | Expected Carryout");
    
    $display("Test Basic Addition:");

    a=4'b0011;b=4'b0111; #1000
    $display(" %b %b |  %b      %b      |      %b     |     1010     |     0    ", a, b, sum, carryout, overflow);
    a=4'b0000;b=4'b0000; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0000     |     0    ", a, b, sum, carryout, overflow);
    a=4'b0001;b=4'b0000; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0001     |     0    ", a, b, sum, carryout, overflow);
    a=4'b0001;b=4'b0001; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0010     |     0    ", a, b, sum, carryout, overflow);
    
    $display("Test Carryout:");
    a=4'b1001;b=4'b1001; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0010     |     1    ", a, b, sum, carryout, overflow);
    a=4'b1101;b=4'b0101; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0010     |     1    ", a, b, sum, carryout, overflow);

    a=4'b1111;b=4'b1100; #1000
    $display(" %b %b |  %b      %b      |      %b     |     1011     |     1    ", a, b, sum, carryout, overflow);
    a=4'b1001;b=4'b1010; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0011     |     1    ", a, b, sum, carryout, overflow);

    $display("Test Overflow: Negative Numbers");

    a=4'b1010;b=4'b1001; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0011     |     1    ", a, b, sum, carryout, overflow);
    a=4'b1100;b=4'b1000; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0100     |     1    ", a, b, sum, carryout, overflow);
    a=4'b1101;b=4'b1000; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0101     |     1    ", a, b, sum, carryout, overflow);

    $display("Test Overflow: Positive Numbers");
    a=4'b0111;b=4'b0111; #1000
    $display(" %b %b |  %b      %b      |      %b     |     1110     |     1    ", a, b, sum, carryout, overflow);
    a=4'b0100; b=4'b0101; #1000
    $display(" %b %b |  %b      %b      |      %b     |     1001     |     1    ", a, b, sum, carryout, overflow);
    a=4'b0110; b=4'b0110; #1000
    $display(" %b %b |  %b      %b      |      %b     |     1100     |     1    ", a, b, sum, carryout, overflow);

    a=4'b1000;b=4'b1000; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0000     |     1    ", a, b, sum, carryout, overflow);
    a=4'b1001;b=4'b1001; #1000
    $display(" %b %b |  %b      %b      |      %b     |     0010     |     1    ", a, b, sum, carryout, overflow);




//these ones are being weird. the a and b written in are not what the thing displays. if you change it to fit what it displays, it changes again?
   
    end
endmodule
