//////////////////////////////////////////////////////////////////////
// File Name:		cache_tag.vh									//
// Function:		cache tag header								//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.09										//
//////////////////////////////////////////////////////////////////////
`ifndef __CACHE_TAG_HEADER__
	`define __CACHE_TAG_HEADER__

	`define ADDR_WIDTH			[9:0]
	`define TAG_WIDTH			[19:0]
	`define TAG_TAB_WIDTH		[20:0]
	`define TAG_DEEPTH			[1023:0]
	`define LOOP_TIMES			1024
	`define INIT				1'b0
	`define	SETTING				1'b1

`endif
