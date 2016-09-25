// Adder circuit

// Setting Delays
`define AND and #50 //delay of 50 units
`define NOT not #50
`define XOR xor #50
`define OR or #50

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
    // Your adder code here
    wire Xor_AB, And_AB, And_XorAB_C;

    `XOR Xor_1(Xor_AB, a, b);
    `XOR Xor_2(sum, Xor_AB, carryin);
    `AND And_1(And_AB, a, b);
    `AND And_2(And_XorAB_C, carryin, Xor_AB);
    `OR Or_1(carryout, And_XorAB_C, And_AB);


endmodule
