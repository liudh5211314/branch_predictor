//////////////////////////////////////////////////////////////////////
// File Name:		bra_his_tab.v									//
// Function:		branch history table							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.29										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/bra_his_tab.vh"
`timescale 1ns/100ps

module bra_his_tab(	input				clk,reset,
					input				wr_en,
					input				wr_data,
					input	`ADDR_WIDTH	addr,
					output	`DATA_WIDTH	rd_data);

	reg	`DATA_WIDTH	tab	`DATA_DEEPTH;
	
	integer i;
	always @(posedge clk) begin
		if(reset)
			for(i = 0;i < `LOOP_CONT;i = i + 1)
				tab[i] <= `INIT;
		else if(wr_en)
			tab[addr] <= {tab[addr][8:0],wr_data};
	end

	assign rd_data = tab[addr];

endmodule
