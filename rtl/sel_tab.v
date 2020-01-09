//////////////////////////////////////////////////////////////////////
// File Name:		sel_tab.v										//
// Function:		branch predictor selection table				//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.01.07										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/sel_tab.vh"
`timescale 1ns/100ps

module sel_tab(	input				clk,reset,
				input				up_en,
				input	`TAB_WIDTH	up_data,
				input	`TAB_ADDR	addr,
				output	`TAB_WIDTH	rd_data);

	reg	`TAB_WIDTH	tab	`TAB_DEEPTH;

	integer i;
	always @(posedge clk) begin
		if(reset)
			for(i = 0;i < `LOOP_TIMES;i = i + 1)
				tab[i] <= `INIT;
		else if(up_en)
			tab[addr] <= up_data;
	end

	assign rd_data = tab[addr];

endmodule
