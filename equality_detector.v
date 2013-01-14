`timescale 1ns / 1ps
// equality_detector.v
// Assignment_2 
// Question : 3
// Name : Rupapara Prashant Govindlal
// Roll Num : 11307R008

module equality_detector (zero_out,gtz_out,result_in);
parameter BUS_WIDTH = 32;

output zero_out,gtz_out;
input  [BUS_WIDTH-1 : 0]result_in; 	

wire  zero_out,gtz_out;
wire  [BUS_WIDTH-1 : 0] result_in; 

assign zero_out = result_in ? 0 : 1;
assign gtz_out = result_in[BUS_WIDTH-1];
		
endmodule
