//////////////////////////////////////////////////////////////////////
// File Name:		pat_tab.v										//
// Function:		pattern history table							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module pat_tab_test;

	reg			clk,reset;
	reg			wr_en;
	reg	[1:0]	wr_data;
	reg [13:0]	addr;
	
	wire [1:0]	rd_data;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		addr = 14'b0;
		#10
		reset = 1;
		#10
		reset = 0;

	end

	always @(posedge clk) begin
		wr_en = 1;
		
	end

	pat_tab pt_module(	.clk		(clk),
						.reset		(reset),
						.wr_en		(wr_en),
						.wr_data	(wr_data),
						.addr		(addr),
						.rd_data	(rd_data));

endmodule
