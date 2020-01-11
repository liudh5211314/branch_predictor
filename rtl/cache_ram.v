//////////////////////////////////////////////////////////////////////
// File Name:		cache_ram.v										//
// Function:		cache ram										//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.11										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/cache_ram.vh"
`timescale 1ns/100ps

module cache_ram(	input					clk,reset,
					input					up_en,
					input	`ADDR_WIDTH		up_addr,
					input	`ADDR_WIDTH		addr,
					input	`DATA_WIDTH		up_data,
					output	`DATA_WIDTH		rd_data);

	reg `DATA_WIDTH tab `DATA_DEEPTH;

	integer i;
	always @(posedge clk) begin
		if(reset) begin
			for(i = 0;i < `LOOP_TIMES;i = i + 1)
				tab[i] <= `INIT;
		end
		if(up_en) begin
			tab[up_addr] <= up_data;
		end	

	end

	assign rd_data = tab[addr];


endmodule
