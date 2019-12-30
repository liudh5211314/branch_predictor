//////////////////////////////////////////////////////////////////////
// File Name:		pre_set_tab.v									//
// Function:		pre_set pattern history table					//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.29										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/pre_set_tab.vh"
`timescale 1ns/100ps

module pre_set_tab(	input					clk,reset,
					input					wr_en,
					input	`DATA_WIDTH		up_data,
					input	`SET_WIDTH		set_addr,
					input	`TAB_DEEPTH		tab_addr,
					output	`DATA_WIDTH		rd_data);

	reg	`DATA_WIDTH	

endmodule
