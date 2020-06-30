module SS3
(
  input   [7:0] adrs,
  output  [31:0] outS3
);

//Output signal
reg [31:0] outS;

always @(*)
  case (adrs)
      8'h0 : outS = 32'h08303838;
			8'h1 : outS = 32'hc8e0e828;
			8'h2 : outS = 32'h0d212c2d;
			8'h3 : outS = 32'h86a2a426;
			8'h4 : outS = 32'hcfc3cc0f;
			8'h5 : outS = 32'hced2dc1e;
			8'h6 : outS = 32'h83b3b033;
			8'h7 : outS = 32'h88b0b838;
			8'h8 : outS = 32'h8fa3ac2f;
			8'h9 : outS = 32'h40606020;
			8'hA : outS = 32'h45515415;
			8'hB : outS = 32'hc7c3c407;
			8'hC : outS = 32'h44404404;
			8'hD : outS = 32'h4f636c2f;
			8'hE : outS = 32'h4b63682b;
			8'hF : outS = 32'h4b53581b;
			
			8'h10 : outS = 32'hc3c3c003;
			8'h11 : outS = 32'h42626022;
			8'h12 : outS = 32'h03333033;
			8'h13 : outS = 32'h85b1b435;
			8'h14 : outS = 32'h09212829;
			8'h15 : outS = 32'h80a0a020;
			8'h16 : outS = 32'hc2e2e022;
			8'h17 : outS = 32'h87a3a427;
			8'h18 : outS = 32'hc3d3d013;
			8'h19 : outS = 32'h81919011;
			8'h1A : outS = 32'h01111011;
			8'h1B : outS = 32'h06020406;
			8'h1C : outS = 32'h0c101c1c;
			8'h1D : outS = 32'h8cb0bc3c;
			8'h1E : outS = 32'h06323436;
			8'h1F : outS = 32'h4b43480b;
			
			8'h20 : outS = 32'hcfe3ec2f;
			8'h21 : outS = 32'h88808808;
			8'h22 : outS = 32'h4c606c2c;
			8'h23 : outS = 32'h88a0a828;
			8'h24 : outS = 32'h07131417;
			8'h25 : outS = 32'hc4c0c404;
			8'h26 : outS = 32'h06121416;
			8'h27 : outS = 32'hc4f0f434;
			8'h28 : outS = 32'hc2c2c002;
			8'h29 : outS = 32'h45414405;
			8'h2A : outS = 32'hc1e1e021;
			8'h2B : outS = 32'hc6d2d416;
			8'h2C : outS = 32'h0f333c3f;
			8'h2D : outS = 32'h0d313c3d;
			8'h2E : outS = 32'h8e828c0e;
			8'h2F : outS = 32'h88909818;
			
			8'h30 : outS = 32'h08202828;
			8'h31 : outS = 32'h4e424c0e;
			8'h32 : outS = 32'hc6f2f436;
			8'h33 : outS = 32'h0e323c3e;
			8'h34 : outS = 32'h85a1a425;
			8'h35 : outS = 32'hc9f1f839;
			8'h36 : outS = 32'h0d010c0d;
			8'h37 : outS = 32'hcfd3dc1f;
			8'h38 : outS = 32'hc8d0d818;
			8'h39 : outS = 32'h0b23282b;
			8'h3A : outS = 32'h46626426;
			8'h3B : outS = 32'h4a72783a;
			8'h3C : outS = 32'h07232427;
			8'h3D : outS = 32'h0f232c2f;
			8'h3E : outS = 32'hc1f1f031;
			8'h3F : outS = 32'h42727032;
			
			8'h40 : outS = 32'h42424002;
			8'h41 : outS = 32'hc4d0d414;
			8'h42 : outS = 32'h41414001;
			8'h43 : outS = 32'hc0c0c000;
			8'h44 : outS = 32'h43737033;
			8'h45 : outS = 32'h47636427;
			8'h46 : outS = 32'h8ca0ac2c;
			8'h47 : outS = 32'h8b83880b;
			8'h48 : outS = 32'hc7f3f437;
			8'h49 : outS = 32'h8da1ac2d;
			8'h4A : outS = 32'h80808000;
			8'h4B : outS = 32'h0f131c1f;
			8'h4C : outS = 32'hcac2c80a;
			8'h4D : outS = 32'h0c202c2c;
			8'h4E : outS = 32'h8aa2a82a;
			8'h4F : outS = 32'h04303434;
			
			8'h50 : outS = 32'hc2d2d012;
			8'h51 : outS = 32'h0b03080b;
			8'h52 : outS = 32'hcee2ec2e;
			8'h53 : outS = 32'hc9e1e829;
			8'h54 : outS = 32'h4d515c1d;
			8'h55 : outS = 32'h84909414;
			8'h56 : outS = 32'h08101818;
			8'h57 : outS = 32'hc8f0f838;
			8'h58 : outS = 32'h47535417;
			8'h59 : outS = 32'h8ea2ac2e;
			8'h5A : outS = 32'h08000808;
			8'h5B : outS = 32'hc5c1c405;
			8'h5C : outS = 32'h03131013;
			8'h5D : outS = 32'hcdc1cc0d;
			8'h5E : outS = 32'h86828406;
			8'h5F : outS = 32'h89b1b839;
			
			8'h60 : outS = 32'hcff3fc3f;
			8'h61 : outS = 32'h4d717c3d;
			8'h62 : outS = 32'hc1c1c001;
			8'h63 : outS = 32'h01313031;
			8'h64 : outS = 32'hc5f1f435;
			8'h65 : outS = 32'h8a82880a;
			8'h66 : outS = 32'h4a62682a;
			8'h67 : outS = 32'h81b1b031;
			8'h68 : outS = 32'hc1d1d011;
			8'h69 : outS = 32'h00202020;
			8'h6A : outS = 32'hc7d3d417;
			8'h6B : outS = 32'h02020002;
			8'h6C : outS = 32'h02222022;
			8'h6D : outS = 32'h04000404;
			8'h6E : outS = 32'h48606828;
			8'h6F : outS = 32'h41717031;
			
			8'h70 : outS = 32'h07030407;
			8'h71 : outS = 32'hcbd3d81b;
			8'h72 : outS = 32'h8d919c1d;
			8'h73 : outS = 32'h89919819;
			8'h74 : outS = 32'h41616021;
			8'h75 : outS = 32'h8eb2bc3e;
			8'h76 : outS = 32'hc6e2e426;
			8'h77 : outS = 32'h49515819;
			8'h78 : outS = 32'hcdd1dc1d;
			8'h79 : outS = 32'h41515011;
			8'h7A : outS = 32'h80909010;
			8'h7B : outS = 32'hccd0dc1c;
			8'h7C : outS = 32'h8a92981a;
			8'h7D : outS = 32'h83a3a023;
			8'h7E : outS = 32'h8ba3a82b;
			8'h7F : outS = 32'hc0d0d010;
			
			8'h80 : outS = 32'h81818001;
			8'h81 : outS = 32'h0f030c0f;
			8'h82 : outS = 32'h47434407;
			8'h83 : outS = 32'h0a12181a;
			8'h84 : outS = 32'hc3e3e023;
			8'h85 : outS = 32'hcce0ec2c;
			8'h86 : outS = 32'h8d818c0d;
			8'h87 : outS = 32'h8fb3bc3f;
			8'h88 : outS = 32'h86929416;
			8'h89 : outS = 32'h4b73783b;
			8'h8A : outS = 32'h4c505c1c;
			8'h8B : outS = 32'h82a2a022;
			8'h8C : outS = 32'h81a1a021;
			8'h8D : outS = 32'h43636023;
			8'h8E : outS = 32'h03232023;
			8'h8F : outS = 32'h4d414c0d;
			
			8'h90 : outS = 32'hc8c0c808;
			8'h91 : outS = 32'h8e929c1e;
			8'h92 : outS = 32'h8c909c1c;
			8'h93 : outS = 32'h0a32383a;
			8'h94 : outS = 32'h0c000c0c;
			8'h95 : outS = 32'h0e222c2e;
			8'h96 : outS = 32'h8ab2b83a;
			8'h97 : outS = 32'h4e626c2e;
			8'h98 : outS = 32'h8f939c1f;
			8'h99 : outS = 32'h4a52581a;
			8'h9A : outS = 32'hc2f2f032;
			8'h9B : outS = 32'h82929012;
			8'h9C : outS = 32'hc3f3f033;
			8'h9D : outS = 32'h49414809;
			8'h9E : outS = 32'h48707838;
			8'h9F : outS = 32'hccc0cc0c;
			
			8'hA0 : outS = 32'h05111415;
			8'hA1 : outS = 32'hcbf3f83b;
			8'hA2 : outS = 32'h40707030;
			8'hA3 : outS = 32'h45717435;
			8'hA4 : outS = 32'h4f737c3f;
			8'hA5 : outS = 32'h05313435;
			8'hA6 : outS = 32'h00101010;
			8'hA7 : outS = 32'h03030003;
			8'hA8 : outS = 32'h44606424;
			8'hA9 : outS = 32'h4d616c2d;
			8'hAA : outS = 32'hc6c2c406;
			8'hAB : outS = 32'h44707434;
			8'hAC : outS = 32'hc5d1d415;
			8'hAD : outS = 32'h84b0b434;
			8'hAE : outS = 32'hcae2e82a;
			8'hAF : outS = 32'h09010809;
			
			8'hB0 : outS = 32'h46727436;
			8'hB1 : outS = 32'h09111819;
			8'hB2 : outS = 32'hcef2fc3e;
			8'hB3 : outS = 32'h40404000;
			8'hB4 : outS = 32'h02121012;
			8'hB5 : outS = 32'hc0e0e020;
			8'hB6 : outS = 32'h8db1bc3d;
			8'hB7 : outS = 32'h05010405;
			8'hB8 : outS = 32'hcaf2f83a;
			8'hB9 : outS = 32'h01010001;
			8'hBA : outS = 32'hc0f0f030;
			8'hBB : outS = 32'h0a22282a;
			8'hBC : outS = 32'h4e525c1e;
			8'hBD : outS = 32'h89a1a829;
			8'hBE : outS = 32'h46525416;
			8'hBF : outS = 32'h43434003;
			
			8'hC0 : outS = 32'h85818405;
			8'hC1 : outS = 32'h04101414;
			8'hC2 : outS = 32'h89818809;
			8'hC3 : outS = 32'h8b93981b;
			8'hC4 : outS = 32'h80b0b030;
			8'hC5 : outS = 32'hc5e1e425;
			8'hC6 : outS = 32'h48404808;
			8'hC7 : outS = 32'h49717839;
			8'hC8 : outS = 32'h87939417;
			8'hC9 : outS = 32'hccf0fc3c;
			8'hCA : outS = 32'h0e121c1e;
			8'hCB : outS = 32'h82828002;
			8'hCC : outS = 32'h01212021;
			8'hCD : outS = 32'h8c808c0c;
			8'hCE : outS = 32'h0b13181b;
			8'hCF : outS = 32'h4f535c1f;
			
			8'hD0 : outS = 32'h47737437;
			8'hD1 : outS = 32'h44505414;
			8'hD2 : outS = 32'h82b2b032;
			8'hD3 : outS = 32'h0d111c1d;
			8'hD4 : outS = 32'h05212425;
			8'hD5 : outS = 32'h4f434c0f;
			8'hD6 : outS = 32'h00000000;
			8'hD7 : outS = 32'h46424406;
			8'hD8 : outS = 32'hcde1ec2d;
			8'hD9 : outS = 32'h48505818;
			8'hDA : outS = 32'h42525012;
			8'hDB : outS = 32'hcbe3e82b;
			8'hDC : outS = 32'h4e727c3e;
			8'hDD : outS = 32'hcad2d81a;
			8'hDE : outS = 32'hc9c1c809;
			8'hDF : outS = 32'hcdf1fc3d;
			
			8'hE0 : outS = 32'h00303030;
			8'hE1 : outS = 32'h85919415;
			8'hE2 : outS = 32'h45616425;
			8'hE3 : outS = 32'h0c303c3c;
			8'hE4 : outS = 32'h86b2b436;
			8'hE5 : outS = 32'hc4e0e424;
			8'hE6 : outS = 32'h8bb3b83b;
			8'hE7 : outS = 32'h4c707c3c;
			8'hE8 : outS = 32'h0e020c0e;
			8'hE9 : outS = 32'h40505010;
			8'hEA : outS = 32'h09313839;
			8'hEB : outS = 32'h06222426;
			8'hEC : outS = 32'h02323032;
			8'hED : outS = 32'h84808404;
			8'hEE : outS = 32'h49616829;
			8'hEF : outS = 32'h83939013;
			
			8'hF0 : outS = 32'h07333437;
			8'hF1 : outS = 32'hc7e3e427;
			8'hF2 : outS = 32'h04202424;
			8'hF3 : outS = 32'h84a0a424;
			8'hF4 : outS = 32'hcbc3c80b;
			8'hF5 : outS = 32'h43535013;
			8'hF6 : outS = 32'h0a02080a;
			8'hF7 : outS = 32'h87838407;
			8'hF8 : outS = 32'hc9d1d819;
			8'hF9 : outS = 32'h4c404c0c;
			8'hFA : outS = 32'h83838003;
			8'hFB : outS = 32'h8f838c0f;
			8'hFC : outS = 32'hcec2cc0e;
			8'hFD : outS = 32'h0b33383b;
			8'hFE : outS = 32'h4a42480a;
			8'hFF : outS = 32'h87b3b437;
			
			default : outS = 32'h00000000;
	 
  endcase

  
assign outS3 = outS;


endmodule