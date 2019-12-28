//////////////////////////////////////////////////////////////////////
// File Name:		fin_sta_mac.v									//
// Function:		finite state machine							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/fin_sta_mac.vh"
`timescale 1ns/100ps

module fin_sta_mac(	input				clk,reset,
					input				torn,
					input	`DATA_WIDTH	in_data,
					
					output	`DATA_WIDTH	outdata);
