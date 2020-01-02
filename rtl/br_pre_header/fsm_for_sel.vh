//////////////////////////////////////////////////////////////////////
// File Name:		fsm_for_sel.vh									//
// Function:		finate state machine for selector header		//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.02										//
//////////////////////////////////////////////////////////////////////
`ifndef __FSM_SEL_HEADER__
	`define __FSM_SEL_HEADER__

	`define DATA_WIDTH	[1:0]
	`define INIT		2'b10
	`define WELL_NTAKEN	2'b00
	`define NTAKEN		2'b01
	`define	TAKEN		2'b10
	`define	WELL_TAKEN	2'b11

`endif
