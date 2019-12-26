//////////////////////////////////////////////////////////////////////
// File Name:		sh_reg_test.v									//
// Function:		shify register testbench						//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.26										//
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module sh_reg_test;

	reg				clk,reset;
	reg				wr_en;
	reg				wr_data;
	reg				re_en;
	reg		[13:0]	re_data;

	wire	[13:0]	rd_data;

	always #10 clk = ~clk;

	initial begin
		
		clk = 0;
		#10
		reset = 1;
		#10
		reset = 0;
		wr_en = 1;
		wr_data = 1;
		#10
		wr_data = 0;
		#10
		wr_data = 1;
		#10
		wr_data = 0;
		#10
		wr_data = 0;
		#10
		wr_data = 1;
		#10
		wr_data = 0;
		#10
		wr_data = 1;
		#10
		wr_data = 1;
		#10
		wr_en = 0;
		wr_data = 0;
		#10
		wr_data = 1;
		#10
		re_en = 1;
		re_data = 14'h2cb9;
		#10
		re_en = 0;
		wr_en = 1;
		wr_data = 0;
		#10
		wr_data = 1;
		#10
		$finish;

	end

	sh_reg sr_module(	.clk		(clk),
						.reset		(reset),
						.wr_en		(wr_en),
						.wr_data	(wr_data),
						.re_en		(re_en),
						.re_data	(re_data),
						.rd_data	(rd_data));

endmodule
