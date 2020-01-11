//////////////////////////////////////////////////////////////////////
// File Name:		cache_ram.vh									//
// Function:		cache ram header								//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.11										//
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module cache_ram_test();
	reg				clk,reset;
	reg				up_en;
	reg		[9:0]	up_addr;
	reg		[9:0]	addr;
	reg		[31:0]	up_data;
	wire	[31:0]	rd_data;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		
	end

endmodule
