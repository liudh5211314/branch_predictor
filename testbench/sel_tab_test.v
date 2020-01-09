//////////////////////////////////////////////////////////////////////
// File Name:		sel_tab_test.v									//
// Function:		branch predictor selection table testbench		//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.01.07										//
//////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module sel_tab_test;
	
	reg				clk,reset;
	reg				up_en;
	reg		[1:0]	up_data;
	reg		[9:0]	addr;
	wire	[1:0]	rd_data;

	always #10 clk = ~clk;
	
	initial begin

		clk = 0;
		reset = 0;
		addr = 0;
		up_en = 0;
		#10
		reset = 1;
		#10
		reset = 0;
		#10
		up_data = 2'b11;
		addr = 1;
		#20
		addr = 2;
		#20
		addr = 3;
		#20
		up_en = 1;
		up_data = 2'b01;
		addr = 0;
		#20
		up_data = 2'b00;
		addr = 1;
		#20
		up_data = 2'b11;
		addr = 2;
		#20
		up_data = 2'b01;
		addr = 3;
		#20
		$finish;
	end

	sel_tab st_module(	.clk		(clk		),
						.reset		(reset		),
						.up_en		(up_en		),
						.up_data	(up_data	),
						.addr		(addr		),
						.rd_data	(rd_data	));

endmodule
