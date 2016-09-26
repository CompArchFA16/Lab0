`include "adder4bit.v"

module testAdder4bit();
  reg[3:0] a;
  reg[3:0] b;
  wire[3:0] sum;
  wire carryout, overflow;

  // behavioralFullAdder adder (sum, carryout, a, b, carryin);
  FullAdder4bit dut(sum, carryout, overflow, a, b);

  initial begin
    $dumpfile("fullAdder4bit.vcd");
    $dumpvars;

    $display("A     B      | Sum   CarryOut Overflow | ESum ECarryout EOverflow");
    a = 4'b0100; b = 4'b0010; #1000
    $display("%b  %b   | %b  %b        %b        | 0110 0         0", a, b, sum, carryout, overflow);
    a = 4'b0010; b = 4'b1101; #1000
    $display("%b  %b   | %b  %b        %b        | 1111 0         0", a, b, sum, carryout, overflow);
    a = 4'b1110; b = 4'b0011; #1000
    $display("%b  %b   | %b  %b        %b        | 0001 1         1", a, b, sum, carryout, overflow);
    a = 4'b1011; b = 4'b1111; #1000
    $display("%b  %b   | %b  %b        %b        | 1100 1         0", a, b, sum, carryout, overflow);
    a = 4'b0101; b = 4'b0100; #1000
    $display("%b  %b   | %b  %b        %b        | 1001 0         0", a, b, sum, carryout, overflow);
    a = 4'b1000; b = 4'b1110; #1000
    $display("%b  %b   | %b  %b        %b        | 0110 1         1", a, b, sum, carryout, overflow);
  end
endmodule
