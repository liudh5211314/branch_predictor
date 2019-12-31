//////////////////////////////////////////////////////////////////////
// File Name:		predictor_top.v									//
// Function:		predictor top									//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.31										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/predictor_top.vh"
`timescale 1ns/100ps

module predictor_top(	input					clk,reset,
						input					dp_en,btb_en,
						input					gshare_reen,
						input					PAs_upen,
						input					type,
						input	`GHR_WIDTH		re_GHR,
						input	`ADDR_WIDTH		addr,
						input	`TARGET_ADDR	up_addr,
						output					torn,
						output	`TARGET_ADDR	tar_addr);
	
	wire `GHR_WIDTH	pht_addr;
	wire `GHR_WIDTH	ghr_out;
	wire			gshare_wr_en;
	wire			gshare_wr_data;
	wire			

	assign pht_addr = ghr_out ^ addr[13:0];
	
	sh_reg sr_module(	.clk		(clk			),
						.reset		(reset			),
						.wr_en		(gshare_wr_en	),
						.wr_data	(gshare_wr_data	),
						.re_en		(gshare_reen	),
						.re_data	(re_GHR			),
						.rd_data	(ghr_out		));

	pat_tab pt_module(	.clk		(clk			),
						.reset		(reset			),
						.wr_en		);	

endmodule
