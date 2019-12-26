//////////////////////////////////////////////////////////////////////
// File Name:		sh_reg.v										//
// Function:		shify register									//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.26										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/sh_reg.vh"
`timescale 1ns/100ps

module sh_reg(	input				clk,reset,
				input				wr_en,
				input				wr_data,
				input				re_en,
				input	`REG_WIDTH	re_data,
				output	`REG_WIDTH	rd_data);

	reg		`REG_WIDTH		shift_reg;

	always @(posedge clk) begin

		if(reset)
			shift_reg <= `INIT;
		else if(wr_en)
			shift_reg <= {shift_reg[12:0],wr_data};
		else if(re_en)
			shift_reg <= re_data;

	end

	assign rd_data = shift_reg;

endmodule
