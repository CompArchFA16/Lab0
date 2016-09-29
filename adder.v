`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module FullAdder1bit
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire axorb;
    wire aandb;
    wire axorb_and_c;
    `XOR xorgate1(axorb,a,b);
    `AND andgate1(aandb,a,b);
    `AND andgate2(axorb_and_c,carryin,axorb);
    `XOR xorgate2(sum,carryin,axorb);
    `OR orgate(carryout,axorb_and_c,aandb);
endmodule

 module FullAdder4bit
(
    output[3:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[3:0] a,     // First operand in 2's complement format
    input[3:0] b      // Second operand in 2's complement format
);

wire carryin = 0;

wire carryout_0;
wire carryout_1; 
wire carryout_2;

FullAdder1bit fa1(sum[0],carryout_0,a[0],b[0],carryin);
FullAdder1bit fa2(sum[1],carryout_1,a[1],b[1],carryout_0);
FullAdder1bit fa3(sum[2],carryout_2,a[2],b[2],carryout_1);
FullAdder1bit fa4(sum[3],carryout,a[3],b[3],carryout_2);
`XOR xorgate(overflow, carryout, carryout_2);
//`AND andgate(overflow, carryout, 1);
//overflow = carryout;

endmodule
