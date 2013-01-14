`timescale 1ns / 1ps
// alu.v
// Assignment_2 
// Question : 3
// Name : Rupapara Prashant Govindlal
// Roll Num : 11307R008

module alu (result_out,s_in,t_in,shamt_in,alucontrol_in);
parameter BUS_WIDTH = 32;

output [BUS_WIDTH-1 : 0] result_out;
input [BUS_WIDTH-1 : 0] s_in,t_in;
input [4:0] shamt_in; 	
input [3:0] alucontrol_in;

reg  [BUS_WIDTH-1 : 0] result_out;
wire [BUS_WIDTH-1 : 0] s_in,t_in; 
wire [4:0] shamt_in;
wire [3:0]alucontrol_in;


always@(*)
	case(alucontrol_in)
		4'b0000: result_out <= s_in & t_in;
		4'b0001: result_out <= s_in | t_in;
		4'b0010: result_out <= s_in + t_in;
		4'b0011: result_out <= s_in ^ t_in;
		4'b0100: result_out <= t_in << s_in[4:0];
		4'b0101: result_out <= t_in >> s_in[4:0];
		4'b0110: result_out <= s_in - t_in;		
		4'b0111: result_out <= 32'b0 - s_in;
		4'b1000: result_out <= t_in << shamt_in;
		4'b1001: result_out <= t_in >> shamt_in;
	endcase
endmodule
