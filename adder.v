// Adder circuit

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire AandB, AandC, BandC;

    `XOR xorGate(sum, a, b, carryin);

    `AND andGate0(AandB, a, b);
    `AND andGate1(AandC, a, carryin);
    `AND andGate2(BandC, b, carryin);

    `OR orGate(carryout, AandB, AandC, BandC);

endmodule


module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire temp_cout[2:0];

    structuralFullAdder fa0(sum[0], temp_cout[0], a[0], b[0], 0);
    structuralFullAdder fa1(sum[1], temp_cout[1], a[1], b[1], temp_cout[0]);
    structuralFullAdder fa2(sum[2], temp_cout[2], a[2], b[2], temp_cout[1]);
    structuralFullAdder fa3(sum[3], carryout, a[3], b[3], temp_cout[2]);
    assign overflow = carryout^temp_cout[2];
endmodule