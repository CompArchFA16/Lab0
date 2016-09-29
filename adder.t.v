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
        $dumpfile("adder.vcd");
        $dumpvars();

        $display("Testing Normal Operation");
        $display(" a    |  b    | sum    co of | Expected");

        // 1
        a=4;
        b=-2;
        #1000
        $display("Testing Pos + Neg");
        $display("1");
        $display("%b  | %b  | %b   %b  %b  | 0010 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 2 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 2
        a=6;
        b=-6;
        #1000
        $display("2");
        $display("%b  | %b  | %b   %b  %b  | 0000 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 0 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 3
        a=-3;
        b=7;
        #1000
        $display("3");
        $display("%b  | %b  | %b   %b  %b  | 0101 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 5 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 4
        a=-4;
        b=0;
        #1000
        $display("4");
        $display("%b  | %b  | %b   %b  %b  | 1100 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -4 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 5
        a=2;
        b=3;
        #1000
        $display("Testing Pos + Pos (no overflow)");
        $display("5");
        $display("%b  | %b  | %b   %b  %b  | 0101 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 5 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 6
        a=6;
        b=0;
        #1000
        $display("6");
        $display("%b  | %b  | %b   %b  %b  | 0110 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 6 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 7
        a=6;
        b=1;
        #1000
        $display("7");
        $display("%b  | %b  | %b   %b  %b  | 0111 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 7 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 8
        a=1;
        b=3;
        #1000
        $display("8");
        $display("%b  | %b  | %b   %b  %b  | 0100 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 4 0 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 9
        a=7;
        b=1;
        #1000
        $display("Testing Pos + Pos (overflow)");
        $display("9");
        $display("%b  | %b  | %b   %b  %b  | 1000 0 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -8 0 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 10
        a=5;
        b=5;
        #1000
        $display("10");
        $display("%b  | %b  | %b   %b  %b  | 1010 0 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -6 0 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 11
        a=3;
        b=6;
        #1000
        $display("11");
        $display("%b  | %b  | %b   %b  %b  | 1001 0 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -7 0 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 12
        a=6;
        b=6;
        #1000
        $display("12");
        $display("%b  | %b  | %b   %b  %b  | 1100 0 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -4 0 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 13
        a=-4;
        b=-6;
        #1000
        $display("Testing Neg + Neg (overflow)");
        $display("13");
        $display("%b  | %b  | %b   %b  %b  | 0110 1 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 6 1 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 14
        a=-1;
        b=-8;
        #1000
        $display("14");
        $display("%b  | %b  | %b   %b  %b  | 0111 1 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 7 1 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 15
        a=-6;
        b=-3;
        #1000
        $display("15");
        $display("%b  | %b  | %b   %b  %b  | 0111 1 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 7 1 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 16
        a=-5;
        b=-5;
        #1000
        $display("16");
        $display("%b  | %b  | %b   %b  %b  | 0110 1 1", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | 6 1 1", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 17
        a=-3;
        b=-2;
        #1000
        $display("Testing Neg + Neg (no overflow)");
        $display("17");
        $display("%b  | %b  | %b   %b  %b  | 1011 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -5 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 18
        a=-1;
        b=-7;
        #1000
        $display("18");
        $display("%b  | %b  | %b   %b  %b  | 1000 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -8 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 19
        a=-6;
        b=-1;
        #1000
        $display("19");
        $display("%b  | %b  | %b   %b  %b  | 1001 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -7 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        // 20
        a=-4;
        b=-4;
        #1000
        $display("20");
        $display("%b  | %b  | %b   %b  %b  | 1000 1 0", a, b, sum, carryout, overflow);
        $display(" %d   |  %d   | %d     %b  %b  | -8 1 0", $signed(a), $signed(b), $signed(sum), carryout, overflow);
        $display("");

        $dumpflush;
    end

endmodule

