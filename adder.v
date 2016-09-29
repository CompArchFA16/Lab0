// Adder circuit for 1 bit and 4 bit (2s complement) 

// Setting Delays
`define AND and #50 //delay of 50 units
`define NOT not #50
`define XOR xor #50
`define OR or #50

// 1 bit adder
module structuralFullAdder
(
    output sum,       // 1 bit sum of a and b and carryin
    output carryout,  // Carry out of the summation of a and b and carryin
    input a,          // 1 bit input a
    input b,          // 1 bit input b
    input carryin     // 1 bit input carryin
);
    // Your adder code here

    wire Xor_AB, And_AB, And_XorAB_C; // Intermediate Wires

    // inputs and intermediate wires are put through gates to find sum and carryout
    `XOR Xor_1(Xor_AB, a, b);                 
    `XOR Xor_2(sum, Xor_AB, carryin);
    `AND And_1(And_AB, a, b);
    `AND And_2(And_XorAB_C, carryin, Xor_AB);
    `OR Or_1(carryout, And_XorAB_C, And_AB);

endmodule

// 4 bit adder (in 2's complement)
module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b (and maybe previous carryin)
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    // Your Code Here

  wire co0, co1, co2; // Intermediate wires that are carryouts, and then carryins

  structuralFullAdder adder0 (sum[0], co0, a[0], b[0], 0);        // adding 0th bit of a and b
  structuralFullAdder adder1 (sum[1], co1, a[1], b[1], co0);      // adding 1st bit of a and b and prev carry out
  structuralFullAdder adder2 (sum[2], co2, a[2], b[2], co1);      // adding 2nd bit of a and b and prev carry out
  structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], co2); // adding 3rd bit of a and b and prev carry out

  `XOR Xor_3(overflow, co2, carryout);  // determining overflow by comparing values of final 2 carry outs

endmodule
