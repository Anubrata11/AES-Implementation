module aes_key_expand( clk,key, key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10);
input	[127:0]	key;
input clk;
output [127:0] key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10;

reg	[31:0]	w0,w1,w2,w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17,
							w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33,
							w34, w35, w36, w37, w38, w39, w40, w41, w42, w43;
wire	[31:0]	subword, subword2,subword3,subword4,subword5, subword6, subword7,subword8,subword9,subword10;			
wire	[7:0]	rcon, rcon2,rcon3,rcon4,rcon5, rcon6, rcon7,rcon8,rcon9,rcon10;	

always @*
begin
 
w0 =  key[127:096];
w1 =  key[095:064];
w2 =  key[063:032];
w3 =  key[031:000];

w4 =  key[127:096]^subword^{8'h01,24'b0};
w5 =  key[095:064]^key[127:096]^subword^{8'h01,24'b0};
w6 =  key[063:032]^key[095:064]^key[127:096]^subword^{8'h01,24'b0}; 
w7 =  key[127:096]^key[095:064]^key[063:032]^key[031:000]^subword^{8'h01,24'b0};

w8  =  w4^subword2^{rcon2,24'b0};
w9  =  w5^w4^subword2^{rcon2,24'b0};
w10 =  w6^w5^w4^subword2^{rcon2,24'b0}; 
w11 =  w7^w6^w5^w4^subword2^{rcon2,24'b0};


w12  =  w8^subword3^{rcon3,24'b0};
w13  =  w8^w9^subword3^{rcon3,24'b0};
w14  =  w8^w9^w10^subword3^{rcon3,24'b0}; 
w15  =  w8^w9^w10^w11^subword3^{rcon3,24'b0};


w16  =  w12^subword4^{rcon4,24'b0};
w17  =  w12^w13^subword4^{rcon4,24'b0};
w18  =  w12^w13^w14^subword4^{rcon4,24'b0}; 
w19  =  w12^w13^w14^w15^subword4^{rcon4,24'b0};


w20  =  w16^subword5^{rcon5,24'b0};
w21  =  w16^w17^subword5^{rcon5,24'b0};
w22  =  w16^w17^w18^subword5^{rcon5,24'b0}; 
w23  =  w16^w17^w18^w19^subword5^{rcon5,24'b0};


w24  =  w20^subword6^{rcon6,24'b0};
w25  =  w20^w21^subword6^{rcon6,24'b0};
w26  =  w20^w21^w22^subword6^{rcon6,24'b0}; 
w27  =  w20^w21^w22^w23^subword6^{rcon6,24'b0};

w28  =  w24^subword7^{rcon7,24'b0};
w29  =  w24^w25^subword7^{rcon7,24'b0};
w30  =  w24^w25^w26^subword7^{rcon7,24'b0}; 
w31  =  w24^w25^w26^w27^subword7^{rcon7,24'b0};


w32  =  w28^subword8^{rcon8,24'b0};
w33  =  w28^w29^subword8^{rcon8,24'b0};
w34  =  w28^w29^w30^subword8^{rcon8,24'b0}; 
w35  =  w28^w29^w30^w31^subword8^{rcon8,24'b0};

w36  =  w32^subword9^{rcon9,24'b0};
w37  =  w32^w33^subword9^{rcon9,24'b0};
w38  =  w32^w33^w34^subword9^{rcon9,24'b0}; 
w39  =  w32^w33^w34^w35^subword9^{rcon9,24'b0};

w40  =  w36^subword10^{rcon10,24'b0};
w41  =  w36^w37^subword10^{rcon10,24'b0};
w42  =  w36^w37^w38^subword10^{rcon10,24'b0}; 
w43  =  w36^w37^w38^w39^subword10^{rcon10,24'b0};

end
aes_rcon r1(clk,rcon,rcon2,rcon3,rcon4,rcon5,rcon6,rcon7,rcon8,rcon9,rcon10);

sBox_8 u0(	.sbox_in(w3[23:16]),.sbox_out_enc(subword[31:24]));
sBox_8 u1(	.sbox_in(w3[15:8]), .sbox_out_enc(subword[23:16]));
sBox_8 u2(	.sbox_in(w3[7:0]), .sbox_out_enc(subword[15:8]));
sBox_8 u3(	.sbox_in(w3[31:24]), .sbox_out_enc(subword[7:0])); 

sBox_8 u4(	.sbox_in(w7[23:16]), .sbox_out_enc(subword2[31:24]));
sBox_8 u5(	.sbox_in(w7[15:08]), .sbox_out_enc(subword2[23:16]));
sBox_8 u6(	.sbox_in(w7[7:0]), .sbox_out_enc(subword2[15:8]));
sBox_8 u7(	.sbox_in(w7[31:24]), .sbox_out_enc(subword2[7:0])); 


sBox_8 u8(	.sbox_in(w11[23:16]), .sbox_out_enc(subword3[31:24]));
sBox_8 u9(	.sbox_in(w11[15:8]), .sbox_out_enc(subword3[23:16]));
sBox_8 u10( .sbox_in(w11[7:0]), .sbox_out_enc(subword3[15:08]));
sBox_8 u11( .sbox_in(w11[31:24]), .sbox_out_enc(subword3[7:0])); 


sBox_8 u12( .sbox_in(w15[23:16]), .sbox_out_enc(subword4[31:24]));
sBox_8 u13( .sbox_in(w15[15:08]), .sbox_out_enc(subword4[23:16]));
sBox_8 u14( .sbox_in(w15[7:0]), .sbox_out_enc(subword4[15:8]));
sBox_8 u15( .sbox_in(w15[31:24]), .sbox_out_enc(subword4[7:0])); 

sBox_8 u16( .sbox_in(w19[23:16]), .sbox_out_enc(subword5[31:24]) );
sBox_8 u17( .sbox_in(w19[15:08]), .sbox_out_enc(subword5[23:16]) );
sBox_8 u18( .sbox_in(w19[7:0]), .sbox_out_enc(subword5[15:8]) );
sBox_8 u19( .sbox_in(w19[31:24]), .sbox_out_enc(subword5[7:0]) );

sBox_8 u20( .sbox_in(w23[23:16]), .sbox_out_enc(subword6[31:24]) );
sBox_8 u21( .sbox_in(w23[15:08]), .sbox_out_enc(subword6[23:16]) );
sBox_8 u22( .sbox_in(w23[7:0]), .sbox_out_enc(subword6[15:8]) );
sBox_8 u23( .sbox_in(w23[31:24]), .sbox_out_enc(subword6[7:0]) );

sBox_8 u24( .sbox_in(w27[23:16]), .sbox_out_enc(subword7[31:24]) );
sBox_8 u25( .sbox_in(w27[15:08]), .sbox_out_enc(subword7[23:16]) );
sBox_8 u26( .sbox_in(w27[7:0]), .sbox_out_enc(subword7[15:8]) );
sBox_8 u27( .sbox_in(w27[31:24]), .sbox_out_enc(subword7[7:0]) );

sBox_8 u28( .sbox_in(w31[23:16]), .sbox_out_enc(subword8[31:24]) );
sBox_8 u29( .sbox_in(w31[15:08]), .sbox_out_enc(subword8[23:16]) );
sBox_8 u30( .sbox_in(w31[7:0]), .sbox_out_enc(subword8[15:8]) );
sBox_8 u31( .sbox_in(w31[31:24]), .sbox_out_enc(subword8[7:0]) );

sBox_8 u32( .sbox_in(w35[23:16]), .sbox_out_enc(subword9[31:24]) );
sBox_8 u33( .sbox_in(w35[15:08]), .sbox_out_enc(subword9[23:16]) );
sBox_8 u34( .sbox_in(w35[7:0]), .sbox_out_enc(subword9[15:8]) );
sBox_8 u35( .sbox_in(w35[31:24]), .sbox_out_enc(subword9[7:0]) );

sBox_8 u36( .sbox_in(w39[23:16]), .sbox_out_enc(subword10[31:24]) );
sBox_8 u37( .sbox_in(w39[15:08]), .sbox_out_enc(subword10[23:16]) );
sBox_8 u38( .sbox_in(w39[7:0]), .sbox_out_enc(subword10[15:8]) );
sBox_8 u39( .sbox_in(w39[31:24]), .sbox_out_enc(subword10[7:0]) );





assign key_s0={w0,w1,w2,w3};
assign key_s1={w4,w5,w6,w7};
assign key_s2={w8,w9,w10,w11};
assign key_s3={w12,w13,w14,w15};
assign key_s4={w16,w17,w18,w19};
assign key_s5={w20,w21,w22,w23};
assign key_s6={w24,w25,w26,w27};
assign key_s7={w28,w29,w30,w31};
assign key_s8={w32,w33,w34,w35};
assign key_s9={w36,w37,w38,w39};
assign key_s10={w40,w41,w42,w43};


endmodule


module aes_rcon(clk,out,out2,out3,out4,out5,out6,out7,out8,out9,out10);

input		clk;

output [7:0] out,out2,out3,out4,out5,out6,out7,out8,out9,out10;



assign		out  = frcon(0);
assign		out2 = frcon(1); 
assign		out3 = frcon(2);
assign		out4 = frcon(3);
assign		out5 = frcon(4);
assign		out6 = frcon(5);
assign		out7 = frcon(6); 
assign		out8 = frcon(7);
assign		out9 = frcon(8);
assign		out10 = frcon(9);		 

function [7:0]	frcon;

input	[3:0]	i;

case(i)	
   4'h0: frcon=8'h01;		//1
   4'h1: frcon=8'h02;		//x
   4'h2: frcon=8'h04;		//x^2
   4'h3: frcon=8'h08;		//x^3
   4'h4: frcon=8'h10;		//x^4
   4'h5: frcon=8'h20;		//x^5
   4'h6: frcon=8'h40;		//x^6
   4'h7: frcon=8'h80;		//x^7
   4'h8: frcon=8'h1b;		//x^8
   4'h9: frcon=8'h36;		//x^9
   default: frcon=8'h00;
endcase

endfunction



endmodule
