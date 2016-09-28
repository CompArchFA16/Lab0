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
    wire abSum;
    wire abXor;
    wire abCinXor;

    `AND andgate(abSum, a, b); //multiply a and b
    `XOR xorgate(abXor, a, b); //exclusive or for a, b
    `AND andgate2(abCinXor, abXor, carryin); //multiply carryin and the xor value for a, b
    `OR orgate(carryout, abSum, abCinXor); //add the sum of a, b and the product of xor and carryin
    `XOR xorgate2(sum, abXor, carryin); //xor the xor of a, b and carryin

endmodule
