`include "adder4bit.v"

module testAdder4bit();
    reg a, b;
    wire sum, carryout, overflow;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit dut(sum, carryout, overflow, a, b);
    initial begin
    $dumpfile("fullAdder4bit.vcd");
    $dumpvars;
    
    $display("A0  A1  A2  A3  B0  B1  B2  B3 | Sum  CarryOut  Overflow | Expected Output");
    a[3]=0;a[2]=1;a[1]=0;a[0]=0;b[3]=0;b[2]=0;b[1]=1;b[0]=0; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 0110", a, b, sum, carryout, overflow);
    a[0]=0;a[1]=0;a[2]=1;a[3]=;b[0]=1;b[1]=1;b[2]=0;b[3]=1; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 1111", a, b, sum, carryout, overflow);
    a[0]=1;a[1]=1;a[2]=1;a[3]=0;b[0]=0;b[1]=0;b[2]=1;b[3]=1; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 0001", a, b, sum, carryout, overflow);
    a[0]=1;a[1]=0;a[2]=1;a[3]=1;b[0]=1;b[1]=1;b[2]=1;b[3]=1; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 1100", a, b, sum, carryout, overflow);
    a[0]=0;a[1]=1;a[2]=0;a[3]=1;b[0]=0;b[1]=1;b[2]=0;b[3]=0; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 1001", a, b, sum, carryout, overflow);
    a[0]=1;a[1]=0;a[2]=0;a[3]=0;b[0]=1;b[1]=1;b[2]=1;b[3]=0; #1000
    $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b | 0110", a, b, sum, carryout, overflow);

    end
endmodule
