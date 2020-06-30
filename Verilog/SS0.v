module SS0
(
  input   [7:0]  adrs,
  output  [31:0] outS0
);

//Output signal
reg [31:0] outS;

always @(*)
  case (adrs)
            8'h0 : outS = 32'h2989a1a8;
			8'h1 : outS = 32'h05858184;
			8'h2 : outS = 32'h16c6d2d4;
			8'h3 : outS = 32'h13c3d3d0;
			8'h4 : outS = 32'h14445054;
			8'h5 : outS = 32'h1d0d111c;
			8'h6 : outS = 32'h2c8ca0ac;
			8'h7 : outS = 32'h25052124;
			8'h8 : outS = 32'h1d4d515c;
			8'h9 : outS = 32'h03434340;
			8'hA : outS = 32'h18081018;
			8'hB : outS = 32'h1e0e121c;
			8'hC : outS = 32'h11415150;
			8'hD : outS = 32'h3cccf0fc;
			8'hE : outS = 32'h0acac2c8;
			8'hF : outS = 32'h23436360;
			
			8'h10 : outS = 32'h28082028;
			8'h11 : outS = 32'h04444044;
			8'h12 : outS = 32'h20002020;
			8'h13 : outS = 32'h1d8d919c;
			8'h14 : outS = 32'h20c0e0e0;
			8'h15 : outS = 32'h22c2e2e0;
			8'h16 : outS = 32'h08c8c0c8;
			8'h17 : outS = 32'h17071314;
			8'h18 : outS = 32'h2585a1a4;
			8'h19 : outS = 32'h0f8f838c;
			8'h1A : outS = 32'h03030300;
			8'h1B : outS = 32'h3b4b7378;
			8'h1C : outS = 32'h3b8bb3b8;
			8'h1D : outS = 32'h13031310;
			8'h1E : outS = 32'h12c2d2d0;
			8'h1F : outS = 32'h2ecee2ec;
			
			8'h20 : outS = 32'h30407070;
			8'h21 : outS = 32'h0c8c808c;
			8'h22 : outS = 32'h3f0f333c;
			8'h23 : outS = 32'h2888a0a8;
			8'h24 : outS = 32'h32023230;
			8'h25 : outS = 32'h1dcdd1dc;
			8'h26 : outS = 32'h36c6f2f4;
			8'h27 : outS = 32'h34447074;
			8'h28 : outS = 32'h2ccce0ec;
			8'h29 : outS = 32'h15859194;
			8'h2A : outS = 32'h0b0b0308;
			8'h2B : outS = 32'h17475354;
			8'h2C : outS = 32'h1c4c505c;
			8'h2D : outS = 32'h1b4b5358;
			8'h2E : outS = 32'h3d8db1bc;
			8'h2F : outS = 32'h01010100;
			
			8'h30 : outS = 32'h24042024;
			8'h31 : outS = 32'h1c0c101c;
			8'h32 : outS = 32'h33437370;
			8'h33 : outS = 32'h18889098;
			8'h34 : outS = 32'h10001010;
			8'h35 : outS = 32'h0cccc0cc;
			8'h36 : outS = 32'h32c2f2f0;
			8'h37 : outS = 32'h19c9d1d8;
			8'h38 : outS = 32'h2c0c202c;
			8'h39 : outS = 32'h27c7e3e4;
			8'h3A : outS = 32'h32427270;
			8'h3B : outS = 32'h03838380;
			8'h3C : outS = 32'h1b8b9398;
			8'h3D : outS = 32'h11c1d1d0;
			8'h3E : outS = 32'h06868284;
			8'h3F : outS = 32'h09c9c1c8;
			
			8'h40 : outS = 32'h20406060;
			8'h41 : outS = 32'h10405050;
			8'h42 : outS = 32'h2383a3a0;
			8'h43 : outS = 32'h2bcbe3e8;
			8'h44 : outS = 32'h0d0d010c;
			8'h45 : outS = 32'h3686b2b4;
			8'h46 : outS = 32'h1e8e929c;
			8'h47 : outS = 32'h0f4f434c;
			8'h48 : outS = 32'h3787b3b4;
			8'h49 : outS = 32'h1a4a5258;
			8'h4A : outS = 32'h06c6c2c4;
			8'h4B : outS = 32'h38487078;
			8'h4C : outS = 32'h2686a2a4;
			8'h4D : outS = 32'h12021210;
			8'h4E : outS = 32'h2f8fa3ac;
			8'h4F : outS = 32'h15c5d1d4;
			
			8'h50 : outS = 32'h21416160;
			8'h51 : outS = 32'h03c3c3c0;
			8'h52 : outS = 32'h3484b0b4;
			8'h53 : outS = 32'h01414140;
			8'h54 : outS = 32'h12425250;
			8'h55 : outS = 32'h3d4d717c;
			8'h56 : outS = 32'h0d8d818c;
			8'h57 : outS = 32'h08080008;
			8'h58 : outS = 32'h1f0f131c;
			8'h59 : outS = 32'h19899198;
			8'h5A : outS = 32'h00000000;
			8'h5B : outS = 32'h19091118;
			8'h5C : outS = 32'h04040004;
			8'h5D : outS = 32'h13435350;
			8'h5E : outS = 32'h37c7f3f4;
			8'h5F : outS = 32'h21c1e1e0;
			
			8'h60 : outS = 32'h3dcdf1fc;
			8'h61 : outS = 32'h36467274;
			8'h62 : outS = 32'h2f0f232c;
			8'h63 : outS = 32'h27072324;
			8'h64 : outS = 32'h3080b0b0;
			8'h65 : outS = 32'h0b8b8388;
			8'h66 : outS = 32'h0e0e020c;
			8'h67 : outS = 32'h2b8ba3a8;
			8'h68 : outS = 32'h2282a2a0;
			8'h69 : outS = 32'h2e4e626c;
			8'h6A : outS = 32'h13839390;
			8'h6B : outS = 32'h0d4d414c;
			8'h6C : outS = 32'h29496168;
			8'h6D : outS = 32'h3c4c707c;
			8'h6E : outS = 32'h09090108;
			8'h6F : outS = 32'h0a0a0208;
			
			8'h70 : outS = 32'h3f8fb3bc;
			8'h71 : outS = 32'h2fcfe3ec;
			8'h72 : outS = 32'h33c3f3f0;
			8'h73 : outS = 32'h05c5c1c4;
			8'h74 : outS = 32'h07878384;
			8'h75 : outS = 32'h14041014;
			8'h76 : outS = 32'h3ecef2fc;
			8'h77 : outS = 32'h24446064;
			8'h78 : outS = 32'h1eced2dc;
			8'h79 : outS = 32'h2e0e222c;
			8'h7A : outS = 32'h0b4b4348;
			8'h7B : outS = 32'h1a0a1218;
			8'h7C : outS = 32'h06060204;
			8'h7D : outS = 32'h21012120;
			8'h7E : outS = 32'h2b4b6368;
			8'h7F : outS = 32'h26466264;
			
			8'h80 : outS = 32'h02020200;
			8'h81 : outS = 32'h35c5f1f4;
			8'h82 : outS = 32'h12829290;
			8'h83 : outS = 32'h0a8a8288;
			8'h84 : outS = 32'h0c0c000c;
			8'h85 : outS = 32'h3383b3b0;
			8'h86 : outS = 32'h3e4e727c;
			8'h87 : outS = 32'h10c0d0d0;
			8'h88 : outS = 32'h3a4a7278;
			8'h89 : outS = 32'h07474344;
			8'h8A : outS = 32'h16869294;
			8'h8B : outS = 32'h25c5e1e4;
			8'h8C : outS = 32'h26062224;
			8'h8D : outS = 32'h00808080;
			8'h8E : outS = 32'h2d8da1ac;
			8'h8F : outS = 32'h1fcfd3dc;
			
			8'h90 : outS = 32'h2181a1a0;
			8'h91 : outS = 32'h30003030;
			8'h92 : outS = 32'h37073334;
			8'h93 : outS = 32'h2e8ea2ac;
			8'h94 : outS = 32'h36063234;
			8'h95 : outS = 32'h15051114;
			8'h96 : outS = 32'h22022220;
			8'h97 : outS = 32'h38083038;
			8'h98 : outS = 32'h34c4f0f4;
			8'h99 : outS = 32'h2787a3a4;
			8'h9A : outS = 32'h05454144;
			8'h9B : outS = 32'h0c4c404c;
			8'h9C : outS = 32'h01818180;
			8'h9D : outS = 32'h29c9e1e8;
			8'h9E : outS = 32'h04848084;
			8'h9F : outS = 32'h17879394;
			
			8'hA0 : outS = 32'h35053134;
			8'hA1 : outS = 32'h0bcbc3c8;
			8'hA2 : outS = 32'h0ecec2cc;
			8'hA3 : outS = 32'h3c0c303c;
			8'hA4 : outS = 32'h31417170;
			8'hA5 : outS = 32'h11011110;
			8'hA6 : outS = 32'h07c7c3c4;
			8'hA7 : outS = 32'h09898188;
			8'hA8 : outS = 32'h35457174;
			8'hA9 : outS = 32'h3bcbf3f8;
			8'hAA : outS = 32'h1acad2d8;
			8'hAB : outS = 32'h38c8f0f8;
			8'hAC : outS = 32'h14849094;
			8'hAD : outS = 32'h19495158;
			8'hAE : outS = 32'h02828280;
			8'hAF : outS = 32'h04c4c0c4;
			
			8'hB0 : outS = 32'h3fcff3fc;
			8'hB1 : outS = 32'h09494148;
			8'hB2 : outS = 32'h39093138;
			8'hB3 : outS = 32'h27476364;
			8'hB4 : outS = 32'h00c0c0c0;
			8'hB5 : outS = 32'h0fcfc3cc;
			8'hB6 : outS = 32'h17c7d3d4;
			8'hB7 : outS = 32'h3888b0b8;
			8'hB8 : outS = 32'h0f0f030c;
			8'hB9 : outS = 32'h0e8e828c;
			8'hBA : outS = 32'h02424240;
			8'hBB : outS = 32'h23032320;
			8'hBC : outS = 32'h11819190;
			8'hBD : outS = 32'h2c4c606c;
			8'hBE : outS = 32'h1bcbd3d8;
			8'hBF : outS = 32'h2484a0a4;
			
			8'hC0 : outS = 32'h34043034;
			8'hC1 : outS = 32'h31c1f1f0;
			8'hC2 : outS = 32'h08484048;
			8'hC3 : outS = 32'h02c2c2c0;
			8'hC4 : outS = 32'h2f4f636c;
			8'hC5 : outS = 32'h3d0d313c;
			8'hC6 : outS = 32'h2d0d212c;
			8'hC7 : outS = 32'h00404040;
			8'hC8 : outS = 32'h3e8eb2bc;
			8'hC9 : outS = 32'h3e0e323c;
			8'hCA : outS = 32'h3c8cb0bc;
			8'hCB : outS = 32'h01c1c1c0;
			8'hCC : outS = 32'h2a8aa2a8;
			8'hCD : outS = 32'h3a8ab2b8;
			8'hCE : outS = 32'h0e4e424c;
			8'hCF : outS = 32'h15455154;
			
			8'hD0 : outS = 32'h3b0b3338;
			8'hD1 : outS = 32'h1cccd0dc;
			8'hD2 : outS = 32'h28486068;
			8'hD3 : outS = 32'h3f4f737c;
			8'hD4 : outS = 32'h1c8c909c;
			8'hD5 : outS = 32'h18c8d0d8;
			8'hD6 : outS = 32'h0a4a4248;
			8'hD7 : outS = 32'h16465254;
			8'hD8 : outS = 32'h37477374;
			8'hD9 : outS = 32'h2080a0a0;
			8'hDA : outS = 32'h2dcde1ec;
			8'hDB : outS = 32'h06464244;
			8'hDC : outS = 32'h3585b1b4;
			8'hDD : outS = 32'h2b0b2328;
			8'hDE : outS = 32'h25456164;
			8'hDF : outS = 32'h3acaf2f8;
			
			8'hE0 : outS = 32'h23c3e3e0;
			8'hE1 : outS = 32'h3989b1b8;
			8'hE2 : outS = 32'h3181b1b0;
			8'hE3 : outS = 32'h1f8f939c;
			8'hE4 : outS = 32'h1e4e525c;
			8'hE5 : outS = 32'h39c9f1f8;
			8'hE6 : outS = 32'h26c6e2e4;
			8'hE7 : outS = 32'h3282b2b0;
			8'hE8 : outS = 32'h31013130;
			8'hE9 : outS = 32'h2acae2e8;
			8'hEA : outS = 32'h2d4d616c;
			8'hEB : outS = 32'h1f4f535c;
			8'hEC : outS = 32'h24c4e0e4;
			8'hED : outS = 32'h30c0f0f0;
			8'hEE : outS = 32'h0dcdc1cc;
			8'hEF : outS = 32'h08888088;
			
			8'hF0 : outS = 32'h16061214;
			8'hF1 : outS = 32'h3a0a3238;
			8'hF2 : outS = 32'h18485058;
			8'hF3 : outS = 32'h14c4d0d4;
			8'hF4 : outS = 32'h22426260;
			8'hF5 : outS = 32'h29092128;
			8'hF6 : outS = 32'h07070304;
			8'hF7 : outS = 32'h33033330;
			8'hF8 : outS = 32'h28c8e0e8;
			8'hF9 : outS = 32'h1b0b1318;
			8'hFA : outS = 32'h05050104;
			8'hFB : outS = 32'h39497178;
			8'hFC : outS = 32'h10809090;
			8'hFD : outS = 32'h2a4a6268;
			8'hFE : outS = 32'h2a0a2228;
			8'hFF : outS = 32'h1a8a9298;
			
			default : outS = 32'h00000000;
	 
  endcase

assign outS0 = outS;
  

endmodule