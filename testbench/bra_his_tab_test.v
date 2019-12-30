//////////////////////////////////////////////////////////////////////
// File Name:		fin_sta_mac.v									//
// Function:		finite state machine							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module bra_his_tab_test;

	reg				clk,reset;
	reg				wr_en;
	reg				wr_data;
	reg		[9:0]	addr;
	wire	[9:0]	rd_data;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		reset = 0;
		addr = 10'b0;
		#10
		reset = 1;
		#10
		reset = 0;
		#10
		wr_en = 1;
		wr_data = 1;
		#20
		wr_data = 0;
		#20
		wr_data = 1;
		#20
		addr = addr + 1;
		wr_data = 1;
		#20
		wr_data = 0;
		#20
		wr_data = 1;
		#20
		addr = addr + 1;
		wr_data = 1;
		#20
		wr_data = 0;
		#20
		wr_data = 1;
		#20
		addr = addr + 1;
		wr_data = 1;
		#20
		wr_data = 0;
		#20
		wr_data = 1;
		#20
		$finish;
	end

	bra_his_tab BHT_module(	.clk		(clk		),
							.reset		(reset		),
							.wr_en		(wr_en		),
							.wr_data	(wr_data	),
							.addr		(addr		),
							.rd_data	(rd_data	));

endmodule
