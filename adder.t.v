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
    // $dumpfile("testFullAdder4bit.vcd");
    // $dumpvars(0, testFullAdder4bit);

    $display(" A  B Ci | Sm Co | Expected Output");
    opA =0;opB=1; #500;
    $display(" %b  %b  |  %b  %b  %b", opA, opB, res0, cout, ovf);

    // for (i = 0; i < 16; i = i +1) begin
    //   $display ("Current value of i is %d", i);
    // end

  end

endmodule
