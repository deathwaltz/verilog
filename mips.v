// mips.v
// Assignment_2 
// Question : 3
// Name : Rupapara Prashant Govindlal
// Roll Num : 11307R008
module mips(memwrite_out,addr_out,writedata_out,memdata_in,clk_in,reset_in);

parameter BUS_WIDTH = 32, REG_ADDR_BITS = 5,MEM_DATA_BUS_WIDTH = 8;

output  memwrite_out;
output [BUS_WIDTH-1 : 0] addr_out;
output [MEM_DATA_BUS_WIDTH-1 : 0]writedata_out;
input  [MEM_DATA_BUS_WIDTH-1 : 0] memdata_in;
input  clk_in,reset_in;
             
wire memwrite_out;
wire [BUS_WIDTH-1 : 0] addr_out;
wire [MEM_DATA_BUS_WIDTH-1 : 0]writedata_out;
wire [MEM_DATA_BUS_WIDTH-1 : 0] memdata_in;
wire clk_in,reset_in;
     

wire zero,gtz;
wire [BUS_WIDTH-1 : 0] instr;
wire memtoreg,iord,pcen,regwrite,regdst,alusrca;
wire [1:0] pcsrc,alusrcb;
wire [3:0] alucontrol,irwrite;

mips_data_path #(BUS_WIDTH,REG_ADDR_BITS,MEM_DATA_BUS_WIDTH)
					datapath(
								zero,gtz,instr,addr_out,writedata_out,
								memdata_in,clk_in,reset_in,
								memtoreg,iord,pcen,regwrite,regdst,
								pcsrc,alusrca,alusrcb,alucontrol,irwrite
								);
							
mips_controller #(BUS_WIDTH,REG_ADDR_BITS,MEM_DATA_BUS_WIDTH) 
					controller(
								memwrite_out,memtoreg,iord,pcen,regwrite,regdst,
								pcsrc,alusrca,alusrcb,alucontrol,irwrite,
								zero,gtz,instr[31:26],instr[5:0],clk_in,reset_in
								);								  
endmodule
