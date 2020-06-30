module SS1
(
  input  wire [7:0] adrs,
  output wire [31:0] outS1
);

//Output signal
reg [31:0] outS;

always @(*)
  case (adrs)
            8'h0 : outS = 32'h38380830;
			8'h1 : outS = 32'he828c8e0;
			8'h2 : outS = 32'h2c2d0d21;
			8'h3 : outS = 32'ha42686a2;
			8'h4 : outS = 32'hcc0fcfc3;
			8'h5 : outS = 32'hdc1eced2;
			8'h6 : outS = 32'hb03383b3;
			8'h7 : outS = 32'hb83888b0;
			8'h8 : outS = 32'hac2f8fa3;
			8'h9 : outS = 32'h60204060;
			8'hA : outS = 32'h54154551;
			8'hB : outS = 32'hc407c7c3;
			8'hC : outS = 32'h44044440;
			8'hD : outS = 32'h6c2f4f63;
			8'hE : outS = 32'h682b4b63;
			8'hF : outS = 32'h581b4b53;
			
			8'h10 : outS = 32'hc003c3c3;
			8'h11 : outS = 32'h60224262;
			8'h12 : outS = 32'h30330333;
			8'h13 : outS = 32'hb43585b1;
			8'h14 : outS = 32'h28290921;
			8'h15 : outS = 32'ha02080a0;
			8'h16 : outS = 32'he022c2e2;
			8'h17 : outS = 32'ha42787a3;
			8'h18 : outS = 32'hd013c3d3;
			8'h19 : outS = 32'h90118191;
			8'h1A : outS = 32'h10110111;
			8'h1B : outS = 32'h04060602;
			8'h1C : outS = 32'h1c1c0c10;
			8'h1D : outS = 32'hbc3c8cb0;
			8'h1E : outS = 32'h34360632;
			8'h1F : outS = 32'h480b4b43;
			
			8'h20 : outS = 32'hec2fcfe3;
			8'h21 : outS = 32'h88088880;
			8'h22 : outS = 32'h6c2c4c60;
			8'h23 : outS = 32'ha82888a0;
			8'h24 : outS = 32'h14170713;
			8'h25 : outS = 32'hc404c4c0;
			8'h26 : outS = 32'h14160612;
			8'h27 : outS = 32'hf434c4f0;
			8'h28 : outS = 32'hc002c2c2;
			8'h29 : outS = 32'h44054541;
			8'h2A : outS = 32'he021c1e1;
			8'h2B : outS = 32'hd416c6d2;
			8'h2C : outS = 32'h3c3f0f33;
			8'h2D : outS = 32'h3c3d0d31;
			8'h2E : outS = 32'h8c0e8e82;
			8'h2F : outS = 32'h98188890;
			
			8'h30 : outS = 32'h28280820;
			8'h31 : outS = 32'h4c0e4e42;
			8'h32 : outS = 32'hf436c6f2;
			8'h33 : outS = 32'h3c3e0e32;
			8'h34 : outS = 32'ha42585a1;
			8'h35 : outS = 32'hf839c9f1;
			8'h36 : outS = 32'h0c0d0d01;
			8'h37 : outS = 32'hdc1fcfd3;
			8'h38 : outS = 32'hd818c8d0;
			8'h39 : outS = 32'h282b0b23;
			8'h3A : outS = 32'h64264662;
			8'h3B : outS = 32'h783a4a72;
			8'h3C : outS = 32'h24270723;
			8'h3D : outS = 32'h2c2f0f23;
			8'h3E : outS = 32'hf031c1f1;
			8'h3F : outS = 32'h70324272;
			
			8'h40 : outS = 32'h40024242;
			8'h41 : outS = 32'hd414c4d0;
			8'h42 : outS = 32'h40014141;
			8'h43 : outS = 32'hc000c0c0;
			8'h44 : outS = 32'h70334373;
			8'h45 : outS = 32'h64274763;
			8'h46 : outS = 32'hac2c8ca0;
			8'h47 : outS = 32'h880b8b83;
			8'h48 : outS = 32'hf437c7f3;
			8'h49 : outS = 32'hac2d8da1;
			8'h4A : outS = 32'h80008080;
			8'h4B : outS = 32'h1c1f0f13;
			8'h4C : outS = 32'hc80acac2;
			8'h4D : outS = 32'h2c2c0c20;
			8'h4E : outS = 32'ha82a8aa2;
			8'h4F : outS = 32'h34340430;
			
			8'h50 : outS = 32'hd012c2d2;
			8'h51 : outS = 32'h080b0b03;
			8'h52 : outS = 32'hec2ecee2;
			8'h53 : outS = 32'he829c9e1;
			8'h54 : outS = 32'h5c1d4d51;
			8'h55 : outS = 32'h94148490;
			8'h56 : outS = 32'h18180810;
			8'h57 : outS = 32'hf838c8f0;
			8'h58 : outS = 32'h54174753;
			8'h59 : outS = 32'hac2e8ea2;
			8'h5A : outS = 32'h08080800;
			8'h5B : outS = 32'hc405c5c1;
			8'h5C : outS = 32'h10130313;
			8'h5D : outS = 32'hcc0dcdc1;
			8'h5E : outS = 32'h84068682;
			8'h5F : outS = 32'hb83989b1;
			
			8'h60 : outS = 32'hfc3fcff3;
			8'h61 : outS = 32'h7c3d4d71;
			8'h62 : outS = 32'hc001c1c1;
			8'h63 : outS = 32'h30310131;
			8'h64 : outS = 32'hf435c5f1;
			8'h65 : outS = 32'h880a8a82;
			8'h66 : outS = 32'h682a4a62;
			8'h67 : outS = 32'hb03181b1;
			8'h68 : outS = 32'hd011c1d1;
			8'h69 : outS = 32'h20200020;
			8'h6A : outS = 32'hd417c7d3;
			8'h6B : outS = 32'h00020202;
			8'h6C : outS = 32'h20220222;
			8'h6D : outS = 32'h04040400;
			8'h6E : outS = 32'h68284860;
			8'h6F : outS = 32'h70314171;
			
			8'h70 : outS = 32'h04070703;
			8'h71 : outS = 32'hd81bcbd3;
			8'h72 : outS = 32'h9c1d8d91;
			8'h73 : outS = 32'h98198991;
			8'h74 : outS = 32'h60214161;
			8'h75 : outS = 32'hbc3e8eb2;
			8'h76 : outS = 32'he426c6e2;
			8'h77 : outS = 32'h58194951;
			8'h78 : outS = 32'hdc1dcdd1;
			8'h79 : outS = 32'h50114151;
			8'h7A : outS = 32'h90108090;
			8'h7B : outS = 32'hdc1cccd0;
			8'h7C : outS = 32'h981a8a92;
			8'h7D : outS = 32'ha02383a3;
			8'h7E : outS = 32'ha82b8ba3;
			8'h7F : outS = 32'hd010c0d0;
			
			8'h80 : outS = 32'h80018181;
			8'h81 : outS = 32'h0c0f0f03;
			8'h82 : outS = 32'h44074743;
			8'h83 : outS = 32'h181a0a12;
			8'h84 : outS = 32'he023c3e3;
			8'h85 : outS = 32'hec2ccce0;
			8'h86 : outS = 32'h8c0d8d81;
			8'h87 : outS = 32'hbc3f8fb3;
			8'h88 : outS = 32'h94168692;
			8'h89 : outS = 32'h783b4b73;
			8'h8A : outS = 32'h5c1c4c50;
			8'h8B : outS = 32'ha02282a2;
			8'h8C : outS = 32'ha02181a1;
			8'h8D : outS = 32'h60234363;
			8'h8E : outS = 32'h20230323;
			8'h8F : outS = 32'h4c0d4d41;
			
			8'h90 : outS = 32'hc808c8c0;
			8'h91 : outS = 32'h9c1e8e92;
			8'h92 : outS = 32'h9c1c8c90;
			8'h93 : outS = 32'h383a0a32;
			8'h94 : outS = 32'h0c0c0c00;
			8'h95 : outS = 32'h2c2e0e22;
			8'h96 : outS = 32'hb83a8ab2;
			8'h97 : outS = 32'h6c2e4e62;
			8'h98 : outS = 32'h9c1f8f93;
			8'h99 : outS = 32'h581a4a52;
			8'h9A : outS = 32'hf032c2f2;
			8'h9B : outS = 32'h90128292;
			8'h9C : outS = 32'hf033c3f3;
			8'h9D : outS = 32'h48094941;
			8'h9E : outS = 32'h78384870;
			8'h9F : outS = 32'hcc0cccc0;
			
			8'hA0 : outS = 32'h14150511;
			8'hA1 : outS = 32'hf83bcbf3;
			8'hA2 : outS = 32'h70304070;
			8'hA3 : outS = 32'h74354571;
			8'hA4 : outS = 32'h7c3f4f73;
			8'hA5 : outS = 32'h34350531;
			8'hA6 : outS = 32'h10100010;
			8'hA7 : outS = 32'h00030303;
			8'hA8 : outS = 32'h64244460;
			8'hA9 : outS = 32'h6c2d4d61;
			8'hAA : outS = 32'hc406c6c2;
			8'hAB : outS = 32'h74344470;
			8'hAC : outS = 32'hd415c5d1;
			8'hAD : outS = 32'hb43484b0;
			8'hAE : outS = 32'he82acae2;
			8'hAF : outS = 32'h08090901;
			
			8'hB0 : outS = 32'h74364672;
			8'hB1 : outS = 32'h18190911;
			8'hB2 : outS = 32'hfc3ecef2;
			8'hB3 : outS = 32'h40004040;
			8'hB4 : outS = 32'h10120212;
			8'hB5 : outS = 32'he020c0e0;
			8'hB6 : outS = 32'hbc3d8db1;
			8'hB7 : outS = 32'h04050501;
			8'hB8 : outS = 32'hf83acaf2;
			8'hB9 : outS = 32'h00010101;
			8'hBA : outS = 32'hf030c0f0;
			8'hBB : outS = 32'h282a0a22;
			8'hBC : outS = 32'h5c1e4e52;
			8'hBD : outS = 32'ha82989a1;
			8'hBE : outS = 32'h54164652;
			8'hBF : outS = 32'h40034343;
			
			8'hC0 : outS = 32'h84058581;
			8'hC1 : outS = 32'h14140410;
			8'hC2 : outS = 32'h88098981;
			8'hC3 : outS = 32'h981b8b93;
			8'hC4 : outS = 32'hb03080b0;
			8'hC5 : outS = 32'he425c5e1;
			8'hC6 : outS = 32'h48084840;
			8'hC7 : outS = 32'h78394971;
			8'hC8 : outS = 32'h94178793;
			8'hC9 : outS = 32'hfc3cccf0;
			8'hCA : outS = 32'h1c1e0e12;
			8'hCB : outS = 32'h80028282;
			8'hCC : outS = 32'h20210121;
			8'hCD : outS = 32'h8c0c8c80;
			8'hCE : outS = 32'h181b0b13;
			8'hCF : outS = 32'h5c1f4f53;
			
			8'hD0 : outS = 32'h74374773;
			8'hD1 : outS = 32'h54144450;
			8'hD2 : outS = 32'hb03282b2;
			8'hD3 : outS = 32'h1c1d0d11;
			8'hD4 : outS = 32'h24250521;
			8'hD5 : outS = 32'h4c0f4f43;
			8'hD6 : outS = 32'h00000000;
			8'hD7 : outS = 32'h44064642;
			8'hD8 : outS = 32'hec2dcde1;
			8'hD9 : outS = 32'h58184850;
			8'hDA : outS = 32'h50124252;
			8'hDB : outS = 32'he82bcbe3;
			8'hDC : outS = 32'h7c3e4e72;
			8'hDD : outS = 32'hd81acad2;
			8'hDE : outS = 32'hc809c9c1;
			8'hDF : outS = 32'hfc3dcdf1;
			
			8'hE0 : outS = 32'h30300030;
			8'hE1 : outS = 32'h94158591;
			8'hE2 : outS = 32'h64254561;
			8'hE3 : outS = 32'h3c3c0c30;
			8'hE4 : outS = 32'hb43686b2;
			8'hE5 : outS = 32'he424c4e0;
			8'hE6 : outS = 32'hb83b8bb3;
			8'hE7 : outS = 32'h7c3c4c70;
			8'hE8 : outS = 32'h0c0e0e02;
			8'hE9 : outS = 32'h50104050;
			8'hEA : outS = 32'h38390931;
			8'hEB : outS = 32'h24260622;
			8'hEC : outS = 32'h30320232;
			8'hED : outS = 32'h84048480;
			8'hEE : outS = 32'h68294961;
			8'hEF : outS = 32'h90138393;
			
			8'hF0 : outS = 32'h34370733;
			8'hF1 : outS = 32'he427c7e3;
			8'hF2 : outS = 32'h24240420;
			8'hF3 : outS = 32'ha42484a0;
			8'hF4 : outS = 32'hc80bcbc3;
			8'hF5 : outS = 32'h50134353;
			8'hF6 : outS = 32'h080a0a02;
			8'hF7 : outS = 32'h84078783;
			8'hF8 : outS = 32'hd819c9d1;
			8'hF9 : outS = 32'h4c0c4c40;
			8'hFA : outS = 32'h80038383;
			8'hFB : outS = 32'h8c0f8f83;
			8'hFC : outS = 32'hcc0ecec2;
			8'hFD : outS = 32'h383b0b33;
			8'hFE : outS = 32'h480a4a42;
			8'hFF : outS = 32'hb43787b3;
			
			default : outS = 32'h00000000;
	 
  endcase

assign outS1 = outS;
  

endmodule