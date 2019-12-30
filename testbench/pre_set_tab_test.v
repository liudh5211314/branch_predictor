//////////////////////////////////////////////////////////////////////
// File Name:		pre_set_tab_test.v								//
// Function:		pre_set pattern history table testbench			//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.29										//
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module pre_set_tab_test;
	
	reg				clk,reset;
	reg				wr_en;
	reg		[1:0]	up_data;
	reg		[1:0]	set_addr;
	reg		[9:0]	tab_addr;
	
	wire	[1:0]	rd_data;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		reset = 0;
		#10
		reset = 1;
		#10
		reset = 0;
		#10
		wr_en = 1;
		set_addr = 2'b00;
		tab_addr = 10'd0;
		up_data = 2'b00;
		#20
		set_addr = 2'b01;
		up_data = 2'b01;
		#20
		set_addr = 2'b10;
		up_data = 2'b11;
		#20
		set_addr = 2'b11;
		up_data = 2'b00;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd1;
		up_data = 2'b01;
		#20
		set_addr = 2'b01;
		up_data = 2'b11;
		#20
		set_addr = 2'b10;
		up_data = 2'b00;
		#20
		set_addr = 2'b11;
		up_data = 2'b01;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd2;
		up_data = 2'b11;
		#20
		set_addr = 2'b01;
		up_data = 2'b00;
		#20
		set_addr = 2'b10;
		up_data = 2'b01;
		#20
		set_addr = 2'b11;
		up_data = 2'b11;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd3;
		up_data = 2'b00;
		#20
		set_addr = 2'b01;
		up_data = 2'b01;
		#20
		set_addr = 2'b10;
		up_data = 2'b11;
		#20
		set_addr = 2'b11;
		up_data = 2'b00;
		#20
		wr_en = 0;
		set_addr = 2'b00;
		tab_addr = 10'd0;
		up_data = 2'b01;
		#20
		set_addr = 2'b01;
		#20
		set_addr = 2'b10;
		#20
		set_addr = 2'b11;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd1;
		#20
		set_addr = 2'b01;
		#20
		set_addr = 2'b10;
		#20
		set_addr = 2'b11;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd2;
		#20
		set_addr = 2'b01;
		#20
		set_addr = 2'b10;
		#20
		set_addr = 2'b11;
		#20
		set_addr = 2'b00;
		tab_addr = 10'd3;
		#20
		set_addr = 2'b01;
		#20
		set_addr = 2'b10;
		#20
		set_addr = 2'b11;
		#20
		$finish;
	end

	pre_set_tab PHT_module(	.clk		(clk		),
							.reset		(reset		),
							.wr_en		(wr_en		),
							.up_data	(up_data	),
							.set_addr	(set_addr	),
							.tab_addr	(tab_addr	),
							.rd_data	(rd_data	));

endmodule
