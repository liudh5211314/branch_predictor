//////////////////////////////////////////////////////////////////////
// File Name:		bra_pre_sel.v									//
// Function:		branch predictor selection table				//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.02										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/bra_pre_sel.vh"
`timescale 1ns/100ps

module bra_pre_sel(	input				clk,reset,
					input				wr_en,
					input	`DATA_WIDTH	in_data,
					input	`ADDR_WIDTH	addr,
					output	`DATA_WIDTH	out_data);

	reg `DATA_WIDTH	tab `BPST_DEEPTH;

	integer i;
	always @(posedge clk) begin
		if(reset)
			for(i = 0;i < `LOOP_CONT;i = i + 1)
				tab[i] <= `INIT;
		else if(wr_en)
			tab[addr] <= in_data;
	end

	assign out_data = tab[addr];

endmodule
