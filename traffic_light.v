`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:33 07/23/2025 
// Design Name: 
// Module Name:    traffic_light 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light(
    input clk,
    input reset,
	 output reg [2:0] NS_light,
	 output reg [2:0] EW_light
    );
	 
	 localparam red= 3'b100 ,yellow = 3'b010, green = 3'b001;
	 localparam NS_green = 2'b00,
					NS_yellow = 2'b01,
					EW_green = 2'b10,
					EW_yellow = 2'b11;
					
	reg [1:0] current_state, next_state;
	reg [15:0] counter;
	
	///////////////////////////////////////////////////////
	
	always @(posedge clk or posedge reset) begin
		if ( reset ) begin
			current_state <= NS_green;
			counter <=0;
		end else begin
			if (current_state != next_state) 
				counter <=0;
			else begin
				counter <= counter +1;
			end
			current_state <= next_state;
		end
	end
	
	///////////////////////////////////////////////////////
	always @(*) begin
		next_state = current_state;
		case (current_state) 
			NS_green: if (counter == 16'd50) next_state = NS_yellow;
			NS_yellow: if (counter == 16'd10) next_state = EW_green;
			EW_green: if (counter == 16'd50) next_state = EW_yellow;
			EW_yellow: if (counter == 16'd10) next_state = NS_green;
		endcase 
	end
	
	always @(*) begin
		case (current_state)
			NS_green: begin
				NS_light = green;
				EW_light = red;
			end
			NS_yellow: begin 
				NS_light = yellow;
				EW_light = red;
			end
			EW_green: begin
				NS_light = red;
				EW_light = green;
			end
			EW_yellow: begin
				NS_light = red;
				EW_light = yellow;
			end
		endcase
	end
endmodule
