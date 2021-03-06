//////////////////////////////////////////////////////////////////////
// File Name:		fin_sta_mac.v									//
// Function:		finite state machine							//
// Discribution:													//
// Auther:			Kerwin Simth									//
// Date:			2019.12.27										//
//////////////////////////////////////////////////////////////////////
`include "../rtl/br_pre_header/fin_sta_mac.vh"
`timescale 1ns/100ps

module fin_sta_mac(	input					clk,reset,
					input					torn,
					input		`DATA_WIDTH	in_data,
					output	reg				up_torn,
					output	reg				wr_en,
					output	reg	`DATA_WIDTH	out_data);
	
	reg `DATA_WIDTH	next_state;

	always @(posedge clk) begin
		if(reset) begin
			up_torn <= 1;
		end
		else if(in_data == `WELL_NTAKEN)
			up_torn <= 0;
		else if(in_data == `NTAKEN)
			up_torn <= 0;
		else if(in_data == `TAKEN)
			up_torn <= 1;
		else if(in_data == `WELL_TAKEN)
			up_torn <= 1;
	end
	
	always @(posedge clk) begin
		if(reset) 
			out_data <= `INIT;
		else
			out_data <= next_state;
	end

	always @(*) begin
		case(in_data)
			`WELL_NTAKEN:begin
				if(torn)
					#1 next_state = `NTAKEN;
				else
					#1 next_state = `WELL_NTAKEN;
			end
			`NTAKEN:begin
				if(torn)
					#1 next_state = `TAKEN;
				else
					#1 next_state = `WELL_NTAKEN;
			end
			`TAKEN:begin
				if(torn)
					#1 next_state = `WELL_TAKEN;
				else
					#1 next_state = `NTAKEN;
			end
			`WELL_TAKEN:begin
				if(torn)
					#1 next_state = `WELL_TAKEN;
				else
					#1 next_state = `TAKEN;
			end
		endcase
	end

	always @(posedge clk) begin
		if(in_data == `WELL_NTAKEN && !torn || in_data == `WELL_TAKEN && torn)
			wr_en <= 0;
		else 
			wr_en <= 1;
	end

endmodule
