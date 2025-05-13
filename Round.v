module round(clk,data_in,key_in,data_out);
input clk;
input [127:0]data_in,key_in;
output [127:0] data_out;

wire [127:0]sub_data_out,shift_data_out,mix_data_out; 

subbytes a1(clk,data_in,sub_data_out);
shiftrows a2(clk,sub_data_out,shift_data_out);
mixcolumn a3(clk,shift_data_out,mix_data_out);
addRoundKey a4(mix_data_out,data_out,key_in);
endmodule