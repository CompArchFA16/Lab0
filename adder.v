// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module FullAdder
(
  output sum,
  output carryout,
  input a,
  input b,
  input carryin
);
  wire na, nb, nc;
  `NOT not0(na, a);
  `NOT not1(nb, b);
  `NOT not2(nc, carryin);

  wire na_b_nc, na_nb_c, a_b_c, a_nb_nc;
  `AND and0(na_b_nc, na, b, nc);
  `AND and1(na_nb_c, na, nb, carryin);
  `AND and2(a_b_c, a, b, carryin);
  `AND and3(a_nb_nc, a, nb, nc);

  `OR or0(sum, na_b_nc, na_nb_c, a_b_c, a_nb_nc);

  wire a_b, b_c, a_c;
  `AND and4(a_b, a, b);
  `AND and5(b_c, b, carryin);
  `AND and6(a_c, a, carryin);

  `OR or1(carryout, a_b, b_c, a_c);
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
  wire carryout0, carryout1, carryout2, carryout3
  FullAdder(sum[0], 0, a[0], b[0], carryout0)
  FullAdder(sum[1], carryout0, a[1], b[1], carryout1)
  FullAdder(sum[2], carryout0, a[2], b[2], carryout2)
  FullAdder(sum[3], carryout0, a[3], b[3], carryout)
endmodule
