//////////////////////////////////////////////////////////////////////
// File Name:		pat_tab.v										//
// Function:		pattern history table							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/pat_tab.vh"
`timescale 1ns/100ps

module pat_tab(	input				clk,reset,
				input				wr_en,
				input	`DATA_WIDTH	wr_data,
				input	`WR_ADDR	addr,
				output	`DATA_WIDTH	rd_data);

	reg	`DATA_WIDTH	tab `DATA_DEEPTH;

	assign rd_data = tab[addr];

	integer i;
	always @(posedge clk) begin

		if(reset) begin
			for(i = 0; i < `LOOP_TIMES;i = i + 1)
				tab[i] <= `INIT;
		end
		else if(wr_en)
			tab[addr] <= wr_data;

	end

endmodule
