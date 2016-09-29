// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module test4BitAdder();
    reg[3:0] a;
    reg[3:0] b;
    wire[3:0] sum;
    wire carryout, overflow;

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
        $display("Testing Normal Operation");
        $display(" a    |  b    | sum    co of | Expected");
        //a=-4'd4;
        a=4;
        b=-2;
        #1000
        $display("%b  | %b  | %b   %b  %b  | 0010 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 2 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;
        b=6;
        #1000
        $display("%b  | %b  | %b   %b  %b  | 8 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 8 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;
        a=3;
        b=7;
        #1000
        $display("%b  | %b  | %b   %b  %b  | 8 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 8 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;
        a=0;
        b=0;
        #1000
        $display("%b  | %b  | %b   %b  %b  | 8 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 8 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;
        a='b1010; // -6
        b='b0011; // 3
        #1000
        $display("%b  | %b  | %b   %b  %b  | 8 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 8 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;
        a=14;
        b=0;
        #1000
        $display("%b  | %b  | %b   %b  %b  | 8 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 8 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");
        a=6;

    end

endmodule

/*
module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin

    // DumpTrace
    $dumpfile("adder.vcd");
    $dumpvars;

    // 0 + 0
    $display("a b cin | sum cout | Expected ");
    a=0;b=0;carryin=0; #1000
    $display("%b %b %b   | %b   %b    | 0  0", a, b, carryin, sum, carryout);

    // 1 + 0
    a=1;b=0;carryin=0; #1000
    $display("%b %b %b   | %b   %b    | 1  0", a, b, carryin, sum, carryout);

    // 0 + 1
    a=0;b=1;carryin=0; #1000
    $display("%b %b %b   | %b   %b    | 1  0", a, b, carryin, sum, carryout);

    // 1 + 1
    a=1;b=1;carryin=0; #1000
    $display("%b %b %b   | %b   %b    | 0  1", a, b, carryin, sum, carryout);

    // 0 + 0 (+ 1)
    a=0;b=0;carryin=1; #1000
    $display("%b %b %b   | %b   %b    | 1  0", a, b, carryin, sum, carryout);

    // 1 + 0 (+ 1)
    a=1;b=0;carryin=1; #1000
    $display("%b %b %b   | %b   %b    | 0  1", a, b, carryin, sum, carryout);

    // 0 + 1 (+ 1)
    a=0;b=1;carryin=1; #1000
    $display("%b %b %b   | %b   %b    | 0  1", a, b, carryin, sum, carryout);

    // 1 + 1 (+ 1)
    a=1;b=1;carryin=1; #1000
    $display("%b %b %b   | %b   %b    | 1  1", a, b, carryin, sum, carryout);

    end
endmodule
*/
