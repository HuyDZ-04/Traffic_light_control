`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:59 07/23/2025
// Design Name:   traffic_light
// Module Name:   /home/ise/xilinshare/traffic_light/tb.v
// Project Name:  traffic_light
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] NS_light;
	wire [2:0] EW_light;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.clk(clk), 
		.reset(reset), 
		.NS_light(NS_light), 
		.EW_light(EW_light)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#100 reset =0;
		
        
		// Add stimulus here
		#20000; $stop;
	end
   always #5 clk = ~clk;   
endmodule

