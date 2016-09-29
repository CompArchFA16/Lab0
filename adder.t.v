// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

`define TEST(a_v,b_v) a=a_v; b=b_v; #1000;

`define DISP(exp, msg) $display("%d %d | %d  |     %d      |    %d     |%d : %s",  a, b, sum, a + b, overflow, exp, msg);

module testFullAdder4bit();
	reg signed [4:0] a;
	reg signed [4:0] b;
    wire overflow, carryout;
    wire signed [3:0] sum; 

    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]);

    initial begin

    	$dumpfile("FullAdder4bit.vcd");
		$dumpvars(0, testFullAdder4bit);

		$display("  a   b | sum | expected sum | overflow | expected overflow");
		`TEST(0,0); 
		`DISP(0,"Adding two zeros");
		`TEST(1,2); 
		`DISP(0,"Positive no overflow");
		`TEST(7,3); 
		`DISP(1,"Positive overflow");
		`TEST(7,1); 
		`DISP(1,"Positive boundary overflow");
		`TEST(-1,-3); 
		`DISP(0,"Negative no overflow");
		`TEST(-5,-6); 
		`DISP(1,"Negative overflow");
		`TEST(-4,-4); 
		`DISP(0,"Negative boundary no overflow");
		`TEST(-3,-6); 
		`DISP(1,"Negative boundary overflow");
		`TEST(7,7); 
		`DISP(1,"Positive extreme");
		`TEST(-8,-8); 
		`DISP(1,"Negative extreme");
		`TEST(2,-2); 
		`DISP(0,"Cancel out");
		`TEST(-1,-1); 
		`DISP(0,"Signed VS Unsigned");
		`TEST(2,1); 
		`DISP(0,"Symmetry");
		`TEST(3,0); 
		`DISP(0,"Positive Equality");
		`TEST(-4,0); 
		`DISP(0,"Negative Equality");
		`TEST(-3,7); 
		`DISP(0,"Random test");

		$display(" a  b | sum | overflow | carryout");
		
		for(a= -8; a < 8; a = a + 1) begin
			for(b = -8;b < 8;b = b + 1) begin
				#1000
				$display("%d %d | %d  |    %d     |   %d", a, b, sum, overflow, carryout);
			end
		end
	end
endmodule
