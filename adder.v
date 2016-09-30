// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XNOR xnor #50
`define XOR xor #50

module structuralFullAdder
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
  wire cin;
  assign cin = 1'b0;
  // Chain four single bit adders together to form a 4 bit adder
  structuralFullAdder a0(.sum(sum[0]), .carryout(cout0), .a(a[0]), .b(b[0]), .carryin(cin));
  structuralFullAdder a1(.sum(sum[1]), .carryout(cout1), .a(a[1]), .b(b[1]), .carryin(cout0));
  structuralFullAdder a2(.sum(sum[2]), .carryout(cout2), .a(a[2]), .b(b[2]), .carryin(cout1));
  structuralFullAdder a3(.sum(sum[3]), .carryout(carryout), .a(a[3]), .b(b[3]), .carryin(cout2));
  // Overflow has occured if:
  //   The result of adding two positive numbers is negative
  //   The result of adding two negative numbers is positive
  wire same_sign, switched;
  `XNOR xnor0(same_sign, a[3], b[3]);
  `XOR xor0(switched, sum[3], a[3]);
  `AND and0(overflow, same_sign, switched);
endmodule
