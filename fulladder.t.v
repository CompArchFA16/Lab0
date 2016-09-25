// FullAdder4bit testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit ();

    wire [4:0] sum; // Only wire [3:0] are used for sum, a, b
    reg [4:0] a, b; // Extra bit for making sure that a, b reaches max value in the "for" loop and it doesn't become an infinte loop
    wire carryout, overflow;

    FullAdder4bit fa4b(sum, carryout, overflow, a, b);

	initial begin

        // Dump trace to a file. Open with gtkwave.
        $dumpfile("fulladder4bit.vcd");
        $dumpvars();
        $dumpall;

    	$display("  a    b  |overflow carryout   sum ");
        // Looping from 0000 to 1111 for a and b i.e.
        // looping from 0 to 7 then -8 to -1
    	for(a=4'b0000; a<=4'b1111; a=a+1) begin
            for (b=4'b0000; b<=4'b1111; b=b+1) begin
            	#1000
            	$display("%b%b%b%b %b%b%b%b |   %b        %b       %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], overflow, carryout, sum[3], sum[2], sum[1], sum[0]);
            end
        end
    end

endmodule
