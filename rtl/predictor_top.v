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
						input					PAs_up_en,
						input					PAs_wr_data,
						input	`GHR_WIDTH		re_GHR,
						input	`ADDR_WIDTH		addr,
						input	`TARGET_ADDR	up_addr,
						output					torn,
						output	`TARGET_ADDR	tar_addr);
	
	// gshare difination
	wire `GHR_WIDTH		pht_addr;
	wire `GHR_WIDTH		ghr_out;
	wire				gshare_wr_en;
	wire				gshare_wr_data;
	wire				pht_wr_en;
	wire `PHT_WIDTH		pht_wr_data;
	wire `PHT_WIDTH		pht_rd_data;

	// PAs difination
	wire				PAs_bht_addr;
	wire `RPT_WIDTH		PAs_rd_data;
	wire				PST_wr_en;
	wire `PHT_WIDTH		PST_up_data;
	wire `SET_WIDTH		PST_set_addr;
	wire `TAB_DEEPTH	PST_tab_addr;
	wire `PHT_WIDTH		PST_rd_data;

	// selector
	wire `SEL_WIDTH		SEL_data;

	// gshare branch predictor
	assign pht_addr = ghr_out ^ addr[13:0];
	assign gshare_wr_en = SEL_data[1:1];

	sh_reg sr_module(	.clk		(clk			),
						.reset		(reset			),
						.wr_en		(gshare_wr_en	),
						.wr_data	(gshare_wr_data	),
						.re_en		(gshare_reen	),
						.re_data	(re_GHR			),
						.rd_data	(ghr_out		));

	pat_tab pt_module(	.clk		(clk			),
						.reset		(reset			),
						.wr_en		(pht_wr_en		),
						.wr_data	(pht_wr_data	),
						.addr		(pht_addr		),
						.rd_data	(pht_rd_data	));

	fin_sta_mac fsm_module1(.clk		(clk			),
							.reset		(reset			),
							.torn		(ghr_out[0:0]	),
							.in_data	(pht_rd_data	),
							.up_torn	(gshare_wr_data	),
							.wr_en		(pht_wr_en		),
							.out_data	(pht_wr_data	));

	// PAs branch predictor
	assign PAs_bht_addr = addr[19:10] ^ addr[9:0];
	assign PST_set_addr = addr[1:0];
	assign PST_tab_addr = addr[21:12] ^ addr[11:2];

	bra_his_tab bht_module(	.clk		(clk			),
							.reset		(reset			),
							.wr_en		(PAs_up_en		),
							.wr_data	(PAs_wr_data	),
							.addr		(PAs_bht_addr	),
							.rd_data	(PAs_rd_data	));
	
	pre_set_tab pst_module(	.clk		(clk			),
							.reset		(reset			),
							.wr_en		(PST_wr_en		),
							.up_data	(PST_up_data	),
							.set_addr	(PST_set_addr	),
							.tab_addr	(PST_tab_addr	),
							.rd_data	(PST_rd_data	));

	fin_sta_mac fsm_module2(.clk		(clk			),
							.reset		(reset			),
							.torn		(PAs_wr_data	),
							.in_data	(PST_rd_data	),
							.up_torn	(				),
							.wr_en		(PST_wr_en		),
							.out_data	(PST_up_data	));

	
	

endmodule
