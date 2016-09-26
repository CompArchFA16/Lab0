`include "adder.v"
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format

);

	wire[3:0] sum;
	wire[2:0] internalCarryouts;
  structuralFullAdder adder0 (sum[0], internalCarryouts[0], a[0], b[0], 1'b0);
  structuralFullAdder adder1 (sum[1], internalCarryouts[1], a[1], b[1], internalCarryouts[0]);
  structuralFullAdder adder2 (sum[2], internalCarryouts[2], a[2], b[2], internalCarryouts[1]);
  structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], internalCarryouts[2]);

  `XOR xorgate(overflow, carryout, sum[3]);

endmodule
