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

	reg	`DATA_WIDTH	set_tab `DATA_DEEPTH;
	wire `TRUE_ADDR	addr;

	assign addr = {tab_addr,set_addr};

	integer i;
	always @(posedge clk) begin
		if(reset)
			for(i = 0;i < `LOOP_CONT;i = i + 1)
				set_tab[i] <= `INIT;
		else if(wr_en)
			set_tab[addr] <= up_data;
	end

	assign rd_data = set_tab[addr];

endmodule
