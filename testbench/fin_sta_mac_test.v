//////////////////////////////////////////////////////////////////////
// File Name:		fin_sta_mac_test.v								//
// Function:		finite state machine testbench					//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.28										//
//////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module fin_sta_mac_test;

	reg				clk,reset;
	reg				torn;
	reg		[1:0]	in_data;
	wire			up_torn;
	wire	[1:0]	out_data;

	always #10 clk = ~clk;

	initial begin
		clk = 0;
		reset = 1;
		#10
		reset = 0;
		torn = 1;
		in_data = 2'b00;
		#20
		in_data = 2'b01;
		#20
		in_data = 2'b10;
		#20
		in_data = 2'b11;
		#20
		torn = 0;
		in_data = 2'b00;
		#20
		in_data = 2'b01;
		#20
		in_data = 2'b10;
		#20
		in_data = 2'b11;
		#60
		$finish;
	end

	fin_sta_mac FSM_module(	.clk(clk),
							.reset(reset),
							.torn(torn),
							.in_data(in_data),
							.up_torn(up_torn),
							.out_data(out_data));

endmodule
