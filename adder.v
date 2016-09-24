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
    // Your adder code here
    wire AxorB;
    wire AandB;
    wire AxorBandCin;

    `XOR xorgate1(AxorB, a, b);
    `XOR xorgate2(sum, AxorB, carryin);

    `AND andgate1(AandB, a, b);
    `AND andgate2(AxorBandCin, AxorB, carryin);
    `OR orgate(carryout, AandB, AxorBandCin);

endmodule

module FullAdder4bit
(
    output[3:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[3:0] a,     // First operand in 2's complement format
    input[3:0] b      // Second operand in 2's complement format
);

    wire carryout0;
    wire carryout1;
    wire carryout2;

    structuralFullAdder adder0(sum[0], carryout0, a[0], b[0], 0); // carryin=0 for first bit
    //and andgate0(tempCarryout, carryout, 1);
    structuralFullAdder adder1(sum[1], carryout1, a[1], b[1], carryout0); // carryin=0 for first bit
    structuralFullAdder adder2(sum[2], carryout2, a[2], b[2], carryout1); // carryin=0 for first bit
    structuralFullAdder adder3(sum[3], carryout, a[3], b[3], carryout2); // carryin=0 for first bit

    // figure out if overflow

    if (a[3] == b[3]) begin
        if (sum[3] != carryout) begin
            assign overflow =1;
        end

        else begin
            assign overflow = 0;
        end
    end

    else begin
        assign overflow = 0;
    end

    /*if (a[3] == b[3]) begin // if adding positive and negative
        if (carryout != sum[3]) begin // if the last carryout is different from the last sum
            not notgate(overflow, 0); // set overflow to 1 (true)
        end

        if (sum[3] != a[3]) begin
            not notgate(overflow, 0); // set overflow to 1 (true)
        end

        else begin
            not notgate(overflow, 1); // set overflow to 0 (false)
        end
    end

    else begin
        not notgate(overflow, 1); // set overflow to 0 (false)
    end */


endmodule
