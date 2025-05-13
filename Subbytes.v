module subbytes(clk,data,s_data_out);
	 input clk;
	 input [127:0]data;
	 output  reg [127:0]s_data_out;

	wire [127:0] tmp_out;
		
		

	  sBox_8 q0(.sbox_in(data[127:120]),.sbox_out_enc(tmp_out[127:120] ));
     sBox_8 q1(.sbox_in(data[119:112]),.sbox_out_enc(tmp_out[119:112]));
     sBox_8 q2( .sbox_in(data[111:104]),.sbox_out_enc(tmp_out[111:104]) );
     sBox_8 q3( .sbox_in(data[103:96]),.sbox_out_enc(tmp_out[103:96]));
     
	  sBox_8 q4(.sbox_in(data[95:88]),.sbox_out_enc(tmp_out[95:88]));
    sBox_8 q5(.sbox_in(data[87:80]),.sbox_out_enc(tmp_out[87:80]));
    sBox_8 q6( .sbox_in(data[79:72]),.sbox_out_enc(tmp_out[79:72]) );
    sBox_8 q7( .sbox_in(data[71:64]),.sbox_out_enc(tmp_out[71:64]));
    
     
 	  sBox_8 q8(.sbox_in(data[63:56]),.sbox_out_enc(tmp_out[63:56] ));
   sBox_8 q9(.sbox_in(data[55:48]),.sbox_out_enc(tmp_out[55:48]));
   sBox_8 q10( .sbox_in(data[47:40]),.sbox_out_enc(tmp_out[47:40]) );
   sBox_8 q11( .sbox_in(data[39:32]),.sbox_out_enc(tmp_out[39:32]));
   
     
	  sBox_8 q12(.sbox_in(data[31:24]),.sbox_out_enc(tmp_out[31:24] ));
  sBox_8 q13(.sbox_in(data[23:16]),.sbox_out_enc(tmp_out[23:16]));
  sBox_8 q14( .sbox_in(data[15:8]),.sbox_out_enc(tmp_out[15:8]) );
  sBox_8 q15( .sbox_in(data[7:0]),.sbox_out_enc(tmp_out[7:0]));
  
	  
	always@(posedge clk)
	begin
	
	 s_data_out<=tmp_out;
	end

endmodule