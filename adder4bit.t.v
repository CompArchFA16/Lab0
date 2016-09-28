`include "adder4bit.v"

module testAdder4bit();
  reg[3:0] a;
  reg[3:0] b;
  wire[3:0] sum;
  wire carryout, overflow;

  FullAdder4bit dut(sum, carryout, overflow, a, b);

  initial begin
    $dumpfile("fullAdder4bit.vcd");
    $dumpvars;

    $display("A     B      | Sum   CarryOut Overflow | ESum ECarryout EOverflow");

    // 1. 1 + 1 = 2
    a = 4'b0001; b = 4'b0001; #1000
    $display("%b  %b   | %b  %b        %b        | 0010 0         0", a, b, sum, carryout, overflow);

    // 2. 4 + 2 = 6
    a = 4'b0100; b = 4'b0010; #1000
    $display("%b  %b   | %b  %b        %b        | 0110 0         0", a, b, sum, carryout, overflow);

    // 3. 3 + 4 = 7
    a = 4'b0011; b = 4'b0100; #1000
    $display("%b  %b   | %b  %b        %b        | 0111 0         0", a, b, sum, carryout, overflow);

    // 4. 2 - 3 = -1
    a = 4'b0010; b = 4'b1101; #1000
    $display("%b  %b   | %b  %b        %b        | 1111 0         0", a, b, sum, carryout, overflow);

    // 5. 5 - 5 = 0
    a = 4'b0101; b = 4'b1011; #1000
    $display("%b  %b   | %b  %b        %b        | 0000 1         0", a, b, sum, carryout, overflow);

    // 6. -8 + 7 = -1
    a = 4'b1000; b = 4'b0111; #1000
    $display("%b  %b   | %b  %b        %b        | 1111 0         0", a, b, sum, carryout, overflow);

    // 7. -2 + 3 = 1
    a = 4'b1110; b = 4'b0011; #1000
    $display("%b  %b   | %b  %b        %b        | 0001 1         0", a, b, sum, carryout, overflow);

    // 8. -5 - 1 = -6
    a = 4'b1011; b = 4'b1111; #1000
    $display("%b  %b   | %b  %b        %b        | 1010 1         0", a, b, sum, carryout, overflow);

    // 9. -3 - 4 = -7
    a = 4'b1101; b = 4'b1100; #1000
    $display("%b  %b   | %b  %b        %b        | 1001 1         0", a, b, sum, carryout, overflow);

    // 10. -6 - 2 = -8
    a = 4'b1010; b = 4'b1110; #1000
    $display("%b  %b   | %b  %b        %b        | 1000 1         0", a, b, sum, carryout, overflow);

    // 11. 5 + 4 = 9
    a = 4'b0101; b = 4'b0100; #1000
    $display("%b  %b   | %b  %b        %b        | 1001 0         1", a, b, sum, carryout, overflow);

    // 12. 5 + 7 = 12
    a = 4'b0101; b = 4'b0111; #1000
    $display("%b  %b   | %b  %b        %b        | 1100 0         1", a, b, sum, carryout, overflow);

    // 13. 7 + 7 = 14
    a = 4'b0111; b = 4'b0111; #1000
    $display("%b  %b   | %b  %b        %b        | 1110 0         1", a, b, sum, carryout, overflow);

    // 14. -8 - 8 = -16
    a = 4'b1000; b = 4'b1000; #1000
    $display("%b  %b   | %b  %b        %b        | 0000 1         1", a, b, sum, carryout, overflow);

    // 15. -8 - 2 = -10
    a = 4'b1000; b = 4'b1110; #1000
    $display("%b  %b   | %b  %b        %b        | 0110 1         1", a, b, sum, carryout, overflow);

    // 16. -8 - 1 = -9
    a = 4'b1000; b = 4'b1111; #1000
    $display("%b  %b   | %b  %b        %b        | 0111 1         1", a, b, sum, carryout, overflow);

    // EXTRAS ==================================================================

    // 17. 7 - 7 = 0
    a = 4'b0111; b = 4'b1001; #1000
    $display("%b  %b   | %b  %b        %b        | 0000 1         0", a, b, sum, carryout, overflow);

    // 18. -1 - 1 = -2
    a = 4'b1111; b = 4'b1111; #1000
    $display("%b  %b   | %b  %b        %b        | 1110 1         0", a, b, sum, carryout, overflow);

    // 19. 1 - 1 = 0
    a = 4'b0001; b = 4'b1111; #1000
    $display("%b  %b   | %b  %b        %b        | 0000 1         0", a, b, sum, carryout, overflow);
  end
endmodule
