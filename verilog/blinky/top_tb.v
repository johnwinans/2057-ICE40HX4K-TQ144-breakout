`timescale 100ns/1ps

module tb();

	reg clk;		// the free running clock

	top uut (
		.clk(clk)
		// don't need to connect every signal here if not want to
		);

	initial begin
		$dumpfile("top_tb.vcd");		// where to write the dump
		$dumpvars;						// dump EVERYTHING
		clk = 0;
	end
	
	always #1 clk = ~clk;

	initial begin
		#1000;
		//#16000000;
		$finish;
	end

endmodule
