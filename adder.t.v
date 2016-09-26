// Adder testbench
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder adder (sum, carryout, a, b, carryin);
    initial begin
    $dumpfile("fullAdder.vcd");
    $dumpvars;

    $display("A  B  CarryIn | Sum  CarryOut | Expected Output");
    a=0;b=0;carryin=0; #1000
    $display("%b  %b    %b     | %b     %b       | 0   0", a, b, carryin, sum, carryout);
    a=0;b=0;carryin=1; #1000
    $display("%b  %b    %b     | %b     %b       | 1   0", a, b, carryin, sum, carryout);
    a=0;b=1;carryin=0; #1000
    $display("%b  %b    %b     | %b     %b       | 1   0", a, b, carryin, sum, carryout);
    a=0;b=1;carryin=1; #1000
    $display("%b  %b    %b     | %b     %b       | 0   1", a, b, carryin, sum, carryout);
    a=1;b=0;carryin=0; #1000
    $display("%b  %b    %b     | %b     %b       | 1   0", a, b, carryin, sum, carryout);
    a=1;b=0;carryin=1; #1000
    $display("%b  %b    %b     | %b     %b       | 0   1", a, b, carryin, sum, carryout);
    a=1;b=1;carryin=0; #1000
    $display("%b  %b    %b     | %b     %b       | 0   1", a, b, carryin, sum, carryout);
    a=1;b=1;carryin=1; #1000
    $display("%b  %b    %b     | %b     %b       | 1   1", a, b, carryin, sum, carryout);



    end
endmodule
