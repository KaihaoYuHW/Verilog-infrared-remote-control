`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:43:43 01/25/2024
// Design Name:   top_module
// Module Name:   E:/IC_design/Verilog/FPGA_S6/infrared_rcv/sim/tb_top_module.v
// Project Name:  infrared_rcv
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top_module;

	// Inputs
	reg sys_clk;
	reg sys_rst_n;
	reg infrared_in;

	// Outputs
	wire [5:0] sel;
	wire [7:0] seg;
	wire led;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.sys_clk(sys_clk), 
		.sys_rst_n(sys_rst_n), 
		.infrared_in(infrared_in), 
		.sel(sel), 
		.seg(seg), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		sys_clk = 1'b1;
		sys_rst_n <= 1'b0;
		infrared_in <= 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        sys_rst_n <= 1'b1;

		// Add stimulus here
		#1000
		infrared_in <= 1'b0; #9000000
		infrared_in <= 1'b1; #4500000
		//address code: 8’h99
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//reversed address code: 8’h66
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//address code: 8’h22
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//reversed address code: 8’hdd
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//repeat code
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #42000000
		infrared_in <= 1'b0; #9000000
		infrared_in <= 1'b1; #2250000
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1;
	end

	always #10 sys_clk = ~sys_clk;
      
endmodule

