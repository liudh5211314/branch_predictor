//////////////////////////////////////////////////////////////////////
// File Name:		cache_tag.v										//
// Function:		cache tag										//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.09										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/cache_tag.vh"
`timescale 1ns/100ps

module cache_tag(	input					clk,reset,
					input					up_en,
					input	`ADDR_WIDTH		addr,
					input	`TAG_WIDTH		new_tag,
					output	`TAG_WIDTH		rd_tag);

	reg `TAG_TAB_WIDTH	tab	`TAG_DEEPTH

	integer i;
	always @(posedge clk) begin

		if(reset)
			for(i = 0;i < `LOOP_TIMES;i = i + 1)
				tab[i][20:20] <= `INIT;
		else if(up_en) begin
			tab[addr]`TAG_WIDTH <= new_tag;
			tab[addr][20:20] <= `RESET;
		end

	end

	assign rd_tag = tab

endmodule
