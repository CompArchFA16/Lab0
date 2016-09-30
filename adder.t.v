// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
  reg[3:0] opA, opB;       // Stored inputs to adder
  wire[3:0] res0, res1;     // Output display options
  wire res_sel;             // Select between display options
  wire cout;                // Carry out from adder
  wire ovf;                 // Overflow from adder

  FullAdder4bit adder(.sum(res0), .carryout(cout), .overflow(ovf), .a(opA), .b(opB));

  initial begin
    $dumpfile("testFullAdder4bit.vcd");
    $dumpvars(0, testFullAdder4bit);

    $display("  A     B    |   Sum  Co  Ovf | Expected Output");

    //No carryout, no overflow
    opA=0; opB=0; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0000 0 0", opA, opB, res0, cout, ovf);
    opA=1; opB=1; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0010 0 0", opA, opB, res0, cout, ovf);
    opA=3; opB=4; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0111 0 0", opA, opB, res0, cout, ovf);
    opA=1; opB=-7; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1010 0 0", opA, opB, res0, cout, ovf);

    $display("-----------------------------------------------");

    //Carryout, no overflow
    opA=-4; opB=-4; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1000 1 0", opA, opB, res0, cout, ovf);
    opA=-1; opB=-1; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1110 1 0", opA, opB, res0, cout, ovf);
    opA=6; opB=-1; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0101 1 0", opA, opB, res0, cout, ovf);
    opA=4; opB=-4; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0000 1 0", opA, opB, res0, cout, ovf);

    $display("-----------------------------------------------");

    //No carryout, overflow
    opA=4; opB=4; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1000 0 1", opA, opB, res0, cout, ovf);
    opA=7; opB=7; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1110 0 1", opA, opB, res0, cout, ovf);
    opA=6; opB=7; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1101 0 1", opA, opB, res0, cout, ovf);
    opA=5; opB=6; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 1011 0 1", opA, opB, res0, cout, ovf);

    $display("-----------------------------------------------");

    //Carryout, overflow
    opA=-8; opB=-8; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0000 1 1", opA, opB, res0, cout, ovf);
    opA=-8; opB=-1; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0111 1 1", opA, opB, res0, cout, ovf);
    opA=-6; opB=-7; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0011 1 1", opA, opB, res0, cout, ovf);
    opA=-5; opB=-6; #1000;
    $display(" %b  %b  |  %b  %b    %b  | 0101 1 1", opA, opB, res0, cout, ovf);

    // for (i = 0; i < 16; i = i +1) begin
    //   $display ("Current value of i is %d", i);
    // end

  end

endmodule
