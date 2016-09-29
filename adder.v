// Add delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

/*module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule*/

module structuralFullAdder
(
  // This is the unit module which the FullAdder4bit runs 4 times
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
wire AxorB, AxorBandcarryin, AandB;
// XOR gate is true only if one of the two inputs is true, not both
`XOR xorgate1(AxorB, a, b);
`XOR xorgate2(sum, AxorB, carryin);
// AND gate is true only if both inputs are true
`AND andgate1(AxorBandcarryin, AxorB, carryin);
`AND andgate2(AandB, a, b);
/// OR gate is true if either or both of the inputs are true
`OR orgate(carryout, AxorBandcarryin, AandB);
endmodule

module FullAdder4bit
(
    output [3:0] sum,
    output carryout,
    output overflow,
    input [3:0] a,
    input [3:0] b
);
  wire carryout0, carryout1, carryout2, carryout;
  // This runs the structuralFullAdder four times, once for each 'bit'
  // For the inital run, we don't need to use a carryin. The carryin is relevant for the other four runs. 
  structuralFullAdder add1(sum[0], carryout0, a[0], b[0], 0);
  structuralFullAdder add2(sum[1], carryout1, a[1], b[1], carryout0);
  structuralFullAdder add3(sum[2], carryout2, a[2], b[2], carryout1);
  structuralFullAdder add4(sum[3], carryout, a[3], b[3], carryout2);
  // Overflow occurs if the carryout and carryin are not the same. For this case an XOR gate is optimal.
  `XOR overflowgate(overflow,carryout2,carryout);


endmodule
