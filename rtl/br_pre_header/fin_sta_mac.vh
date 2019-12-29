//////////////////////////////////////////////////////////////////////
// File Name:		fin_sta_mac.vh									//
// Function:		finite state machine header						//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////

`ifndef __FIN_STA_HEADER__
	`define __FIN_STA_HEADER__

	`define DATA_WIDTH	[1:0]
	`define	INIT		2'b10

	`define WELL_NTAKEN	2'b00
	`define NTAKEN		2'b01
	`define	TAKEN		2'b10
	`define	WELL_TAKEN	2'b11

`endif
