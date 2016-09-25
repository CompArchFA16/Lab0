// Adder circuit

// Setting Delays
`define AND and #50 //delay of 50 units
`define NOT not #50
`define XOR xor #50
`define OR or #50

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here
    wire Xor_AB, And_AB, And_XorAB_C;

    `XOR Xor_1(Xor_AB, a, b);
    `XOR Xor_2(sum, Xor_AB, carryin);
    `AND And_1(And_AB, a, b);
    `AND And_2(And_XorAB_C, carryin, Xor_AB);
    `OR Or_1(carryout, And_XorAB_C, And_AB);

endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    // Your Code Here

  wire co0, co1, co2; 
  structuralFullAdder adder0 (sum[0], co0, a[0], b[0], 0);
  structuralFullAdder adder1 (sum[1], co1, a[1], b[1], co0);
  structuralFullAdder adder2 (sum[2], co2, a[2], b[2], co1);
  structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], co2);

  wire n_overflow;
  `XOR Xor_3(n_overflow, sum[3], carryout);
  `NOT N_Xor_3(overflow, n_overflow);

endmodule
