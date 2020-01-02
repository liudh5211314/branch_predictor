//////////////////////////////////////////////////////////////////////
// File Name:		fsm_for_sel.v									//
// Function:		finate state machine for selector				//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.31										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/fsm_for_sel.vh"
`timescale 1ns/100ps

module fsm_for_sel(	input						clk,reset,
					input						torf,
					input		`DATA_WIDTH		in_data,
					output	reg					wr_en,
					output	reg	`DATA_WIDTH		out_data);

	reg	`DATA_WIDTH	next_state;	

	always @(posedge clk) begin
		if(reset)
			out_data <= `INIT;
		else 
			out_data <= next_state;
	end

	always @(*) begin
		
		case(in_data)
			`WELL_NTAKEN:begin
				if(torf)
					next_state = `WELL_NTAKEN;
				else
					next_state = `NTAKEN;
			end
			`NTAKEN:begin
				if(torf)
					next_state = `WELL_NTAKEN;
				else
					next_state = `TAKEN;
			end
			`TAKEN:begin
				if(torf)
					next_state = `WELL_TAKEN;
				else
					next_state = `NTAKEN;
			end
			`WELL_TAKEN:begin
				if(torf)
					next_state = `WELL_TAKEN;
				else
					next_state = `TAKEN;
			end
		endcase

	end

	always @(posedge clk) begin
		if(in_data == `WELL_NTAKEN && torf || in_data == `WELL_TAKEN && torf)
			wr_en <= 0;
		else
			wr_en <= 1;
	end

endmodule
