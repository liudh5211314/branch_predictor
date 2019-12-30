//////////////////////////////////////////////////////////////////////
// File Name:		pre_set_tab.v									//
// Function:		pre_set pattern history table header			//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.29										//
//////////////////////////////////////////////////////////////////////

`ifndef __PRE_TAB_HEADER__
	`define __PRE_TAB_HEADER__

	`define DATA_WIDTH		[1:0]
	`define	SET_WIDTH		[1:0]
	`define	TAB_DEEPTH		[9:0]
	`define DATA_DEEPTH		[4095:0]
	`define	TRUE_ADDR		[11:0]
	`define	LOOP_CONT		4096
	`define INIT			2'b10

`endif
