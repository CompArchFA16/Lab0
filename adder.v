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
    // first bit adder (0)
  structuralFullAdder adder0 (sum[0], carryout, a[0], b[0], 0);
  structuralFullAdder adder1 (sum[1], carryout, a[1], b[1], carryout);
  structuralFullAdder adder2 (sum[2], carryout, a[2], b[2], carryout);
  structuralFullAdder adder3 (sum[3], overflow, a[3], b[3], carryout);

endmodule
