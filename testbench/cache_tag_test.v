//////////////////////////////////////////////////////////////////////
// File Name:		cache_tag_test.v								//
// Function:		cache tag testbench								//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2020.01.09										//
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module cache_tag_test();

	reg					clk,reset;
	reg					up_en;
	reg		[9:0]		up_addr;
	reg		[9:0]		addr;
	reg		[19:0]		new_tag;
	wire	[19:0]		rd_tag;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		reset = 0;
		up_en = 0;
		up_addr = 10'b0;
		addr = 10'b0;
		new_tag = 20'b0;
		#10 
		reset = 1;
		#10
		reset = 0;
		#60000
		$finish;
	end

	initial begin
		repeat(1024) @(posedge clk) begin
			#3	up_en = 1;
			new_tag = $urandom_range(1,1048575);
			if(reset == 0)
				up_addr = up_addr + 1;
		end
		repeat(1024) @(posedge clk) begin
			#3	up_en = 0;
			addr = addr + 1;
		end
	end

	cache_tag	ct_module(	.clk			(clk			),
							.reset			(reset			),
							.up_en			(up_en			),
							.up_addr		(up_addr		),
							.addr			(addr			),
							.new_tag		(new_tag		),
							.rd_tag			(rd_tag			));

endmodule
