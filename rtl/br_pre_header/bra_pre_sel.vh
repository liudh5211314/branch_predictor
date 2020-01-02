//////////////////////////////////////////////////////////////////////
// File Name:		bra_pre_sel.v									//
// Function:		branch predictor selection table				//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.02.02										//
//////////////////////////////////////////////////////////////////////
`ifndef __SEL_HEADER__
	`define __SEL_HEADER__

	`define DATA_WIDTH	[1:0]
	`define ADDR_WIDTH	[9:0]
	`define BPST_DEEPTH	[1023:0]
	`define	LOOP_CONT	1024
	`define INIT		2'b00

`endif
