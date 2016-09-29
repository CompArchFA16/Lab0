// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

// Set value and delay
`define SET(a_v,b_v) a=a_v; b=b_v; #1000

// Display values with expected overflow, and an extra message parameter
`define DISP(exp, msg) $display("%d %d | %d  |     %d      |     %d    |    %d     |%d : %s",  a, b, sum, a + b, carryout, overflow, exp, msg)

module testFullAdder4bit();
	reg signed [4:0] a; // needs 1 more bit for comparison against 8, in the loop
	reg signed [4:0] b; // ditto
    wire overflow, carryout;
    wire signed [3:0] sum; // 4-bit is sufficient for the sum

    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]); // only use the right 4 bits

    initial begin

    	$dumpfile("FullAdder4bit.vcd");

		$dumpvars(0, testFullAdder4bit);

		$display("  a   b | sum | expected sum | carryout | overflow | expected overflow | comment");

		`SET(0,0);
		`DISP(0,"Adding two zeros");
		`SET(1,2); 
		`DISP(0,"Positive no overflow");
		`SET(7,3); 
		`DISP(1,"Positive overflow");
		`SET(7,1); 
		`DISP(1,"Positive boundary overflow");
		`SET(-1,-3); 
		`DISP(0,"Negative no overflow");
		`SET(-5,-6); 
		`DISP(1,"Negative overflow");
		`SET(-4,-4); 
		`DISP(0,"Negative boundary no overflow");
		`SET(-3,-6); 
		`DISP(1,"Negative boundary overflow");
		`SET(7,7); 
		`DISP(1,"Positive extreme");
		`SET(-8,-8); 
		`DISP(1,"Negative extreme");
		`SET(2,-2); 
		`DISP(0,"Cancel out");
		`SET(-1,-1); 
		`DISP(0,"Signed VS Unsigned");
		`SET(2,1); 
		`DISP(0,"Symmetry");
		`SET(3,0); 
		`DISP(0,"Positive Equality");
		`SET(-4,0); 
		`DISP(0,"Negative Equality");
		`SET(-3,7); 
		`DISP(0,"Random test");

		// Exhaustively testing against all cases ...
		
		$display(" a  b | sum | overflow | carryout");

		for(a= -8; a < 8; a = a + 1) begin
			for(b = -8;b < 8;b = b + 1) begin
				#1000
				$display("%d %d | %d  |    %d     |   %d", a, b, sum, overflow, carryout);
			end
		end
	end
endmodule
