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

    wire axorb;

    wire bandc;
    wire aandc;
    wire aandb;
    wire bcorac;
    
    // Carryout
    `AND andgate0 (bandc, b, carryin);
    `AND andgate1 (aandc, a, carryin);
    `AND andgate2 (aandb, a, b);
    `OR  orgate0  (bcorac, aandc, bandc);
    `OR  orgate1  (carryout, bcorac, aandb);

    // Sum
    `XOR xorgate0 (axorb, a, b);
    `XOR xorgate1 (sum, axorb, carryin);

endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire[3:0] a;
    wire[3:0] b;
    wire carryout0, carryout1, carryout2;
    wire noverflow;
    structuralFullAdder adder0 (sum[0], carryout0, a[0], b[0], 'b0);
    structuralFullAdder adder1 (sum[1], carryout1, a[1], b[1], carryout0);
    structuralFullAdder adder2 (sum[2], carryout2, a[2], b[2], carryout1);
    structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], carryout2);

    `XOR xorgate0 (overflow, carryout2, carryout);

endmodule

