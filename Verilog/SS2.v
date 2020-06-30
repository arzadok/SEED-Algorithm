module SS2
(
  input  wire [7:0] adrs,
  output wire [31:0] outS2
);

//Output signal
reg [31:0] outS;

always @(*)
  case (adrs)
      8'h0 : outS = 32'ha1a82989;
			8'h1 : outS = 32'h81840585;
			8'h2 : outS = 32'hd2d416c6;
			8'h3 : outS = 32'hd3d013c3;
			8'h4 : outS = 32'h50541444;
			8'h5 : outS = 32'h111c1d0d;
			8'h6 : outS = 32'ha0ac2c8c;
			8'h7 : outS = 32'h21242505;
			8'h8 : outS = 32'h515c1d4d;
			8'h9 : outS = 32'h43400343;
			8'hA : outS = 32'h10181808;
			8'hB : outS = 32'h121c1e0e;
			8'hC : outS = 32'h51501141;
			8'hD : outS = 32'hf0fc3ccc;
			8'hE : outS = 32'hc2c80aca;
			8'hF : outS = 32'h63602343;
			
			8'h10 : outS = 32'h20282808;
			8'h11 : outS = 32'h40440444;
			8'h12 : outS = 32'h20202000;
			8'h13 : outS = 32'h919c1d8d;
			8'h14 : outS = 32'he0e020c0;
			8'h15 : outS = 32'he2e022c2;
			8'h16 : outS = 32'hc0c808c8;
			8'h17 : outS = 32'h13141707;
			8'h18 : outS = 32'ha1a42585;
			8'h19 : outS = 32'h838c0f8f;
			8'h1A : outS = 32'h03000303;
			8'h1B : outS = 32'h73783b4b;
			8'h1C : outS = 32'hb3b83b8b;
			8'h1D : outS = 32'h13101303;
			8'h1E : outS = 32'hd2d012c2;
			8'h1F : outS = 32'he2ec2ece;
			
			8'h20 : outS = 32'h70703040;
			8'h21 : outS = 32'h808c0c8c;
			8'h22 : outS = 32'h333c3f0f;
			8'h23 : outS = 32'ha0a82888;
			8'h24 : outS = 32'h32303202;
			8'h25 : outS = 32'hd1dc1dcd;
			8'h26 : outS = 32'hf2f436c6;
			8'h27 : outS = 32'h70743444;
			8'h28 : outS = 32'he0ec2ccc;
			8'h29 : outS = 32'h91941585;
			8'h2A : outS = 32'h03080b0b;
			8'h2B : outS = 32'h53541747;
			8'h2C : outS = 32'h505c1c4c;
			8'h2D : outS = 32'h53581b4b;
			8'h2E : outS = 32'hb1bc3d8d;
			8'h2F : outS = 32'h01000101;
			
			8'h30 : outS = 32'h20242404;
			8'h31 : outS = 32'h101c1c0c;
			8'h32 : outS = 32'h73703343;
			8'h33 : outS = 32'h90981888;
			8'h34 : outS = 32'h10101000;
			8'h35 : outS = 32'hc0cc0ccc;
			8'h36 : outS = 32'hf2f032c2;
			8'h37 : outS = 32'hd1d819c9;
			8'h38 : outS = 32'h202c2c0c;
			8'h39 : outS = 32'he3e427c7;
			8'h3A : outS = 32'h72703242;
			8'h3B : outS = 32'h83800383;
			8'h3C : outS = 32'h93981b8b;
			8'h3D : outS = 32'hd1d011c1;
			8'h3E : outS = 32'h82840686;
			8'h3F : outS = 32'hc1c809c9;
			
			8'h40 : outS = 32'h60602040;
			8'h41 : outS = 32'h50501040;
			8'h42 : outS = 32'ha3a02383;
			8'h43 : outS = 32'he3e82bcb;
			8'h44 : outS = 32'h010c0d0d;
			8'h45 : outS = 32'hb2b43686;
			8'h46 : outS = 32'h929c1e8e;
			8'h47 : outS = 32'h434c0f4f;
			8'h48 : outS = 32'hb3b43787;
			8'h49 : outS = 32'h52581a4a;
			8'h4A : outS = 32'hc2c406c6;
			8'h4B : outS = 32'h70783848;
			8'h4C : outS = 32'ha2a42686;
			8'h4D : outS = 32'h12101202;
			8'h4E : outS = 32'ha3ac2f8f;
			8'h4F : outS = 32'hd1d415c5;
			
			8'h50 : outS = 32'h61602141;
			8'h51 : outS = 32'hc3c003c3;
			8'h52 : outS = 32'hb0b43484;
			8'h53 : outS = 32'h41400141;
			8'h54 : outS = 32'h52501242;
			8'h55 : outS = 32'h717c3d4d;
			8'h56 : outS = 32'h818c0d8d;
			8'h57 : outS = 32'h00080808;
			8'h58 : outS = 32'h131c1f0f;
			8'h59 : outS = 32'h91981989;
			8'h5A : outS = 32'h00000000;
			8'h5B : outS = 32'h11181909;
			8'h5C : outS = 32'h00040404;
			8'h5D : outS = 32'h53501343;
			8'h5E : outS = 32'hf3f437c7;
			8'h5F : outS = 32'he1e021c1;
			
			8'h60 : outS = 32'hf1fc3dcd;
			8'h61 : outS = 32'h72743646;
			8'h62 : outS = 32'h232c2f0f;
			8'h63 : outS = 32'h23242707;
			8'h64 : outS = 32'hb0b03080;
			8'h65 : outS = 32'h83880b8b;
			8'h66 : outS = 32'h020c0e0e;
			8'h67 : outS = 32'ha3a82b8b;
			8'h68 : outS = 32'ha2a02282;
			8'h69 : outS = 32'h626c2e4e;
			8'h6A : outS = 32'h93901383;
			8'h6B : outS = 32'h414c0d4d;
			8'h6C : outS = 32'h61682949;
			8'h6D : outS = 32'h707c3c4c;
			8'h6E : outS = 32'h01080909;
			8'h6F : outS = 32'h02080a0a;
			
			8'h70 : outS = 32'hb3bc3f8f;
			8'h71 : outS = 32'he3ec2fcf;
			8'h72 : outS = 32'hf3f033c3;
			8'h73 : outS = 32'hc1c405c5;
			8'h74 : outS = 32'h83840787;
			8'h75 : outS = 32'h10141404;
			8'h76 : outS = 32'hf2fc3ece;
			8'h77 : outS = 32'h60642444;
			8'h78 : outS = 32'hd2dc1ece;
			8'h79 : outS = 32'h222c2e0e;
			8'h7A : outS = 32'h43480b4b;
			8'h7B : outS = 32'h12181a0a;
			8'h7C : outS = 32'h02040606;
			8'h7D : outS = 32'h21202101;
			8'h7E : outS = 32'h63682b4b;
			8'h7F : outS = 32'h62642646;
			
			8'h80 : outS = 32'h02000202;
			8'h81 : outS = 32'hf1f435c5;
			8'h82 : outS = 32'h92901282;
			8'h83 : outS = 32'h82880a8a;
			8'h84 : outS = 32'h000c0c0c;
			8'h85 : outS = 32'hb3b03383;
			8'h86 : outS = 32'h727c3e4e;
			8'h87 : outS = 32'hd0d010c0;
			8'h88 : outS = 32'h72783a4a;
			8'h89 : outS = 32'h43440747;
			8'h8A : outS = 32'h92941686;
			8'h8B : outS = 32'he1e425c5;
			8'h8C : outS = 32'h22242606;
			8'h8D : outS = 32'h80800080;
			8'h8E : outS = 32'ha1ac2d8d;
			8'h8F : outS = 32'hd3dc1fcf;
			
			8'h90 : outS = 32'ha1a02181;
			8'h91 : outS = 32'h30303000;
			8'h92 : outS = 32'h33343707;
			8'h93 : outS = 32'ha2ac2e8e;
			8'h94 : outS = 32'h32343606;
			8'h95 : outS = 32'h11141505;
			8'h96 : outS = 32'h22202202;
			8'h97 : outS = 32'h30383808;
			8'h98 : outS = 32'hf0f434c4;
			8'h99 : outS = 32'ha3a42787;
			8'h9A : outS = 32'h41440545;
			8'h9B : outS = 32'h404c0c4c;
			8'h9C : outS = 32'h81800181;
			8'h9D : outS = 32'he1e829c9;
			8'h9E : outS = 32'h80840484;
			8'h9F : outS = 32'h93941787;
			
			8'hA0 : outS = 32'h31343505;
			8'hA1 : outS = 32'hc3c80bcb;
			8'hA2 : outS = 32'hc2cc0ece;
			8'hA3 : outS = 32'h303c3c0c;
			8'hA4 : outS = 32'h71703141;
			8'hA5 : outS = 32'h11101101;
			8'hA6 : outS = 32'hc3c407c7;
			8'hA7 : outS = 32'h81880989;
			8'hA8 : outS = 32'h71743545;
			8'hA9 : outS = 32'hf3f83bcb;
			8'hAA : outS = 32'hd2d81aca;
			8'hAB : outS = 32'hf0f838c8;
			8'hAC : outS = 32'h90941484;
			8'hAD : outS = 32'h51581949;
			8'hAE : outS = 32'h82800282;
			8'hAF : outS = 32'hc0c404c4;
			
			8'hB0 : outS = 32'hf3fc3fcf;
			8'hB1 : outS = 32'h41480949;
			8'hB2 : outS = 32'h31383909;
			8'hB3 : outS = 32'h63642747;
			8'hB4 : outS = 32'hc0c000c0;
			8'hB5 : outS = 32'hc3cc0fcf;
			8'hB6 : outS = 32'hd3d417c7;
			8'hB7 : outS = 32'hb0b83888;
			8'hB8 : outS = 32'h030c0f0f;
			8'hB9 : outS = 32'h828c0e8e;
			8'hBA : outS = 32'h42400242;
			8'hBB : outS = 32'h23202303;
			8'hBC : outS = 32'h91901181;
			8'hBD : outS = 32'h606c2c4c;
			8'hBE : outS = 32'hd3d81bcb;
			8'hBF : outS = 32'ha0a42484;
			
			8'hC0 : outS = 32'h30343404;
			8'hC1 : outS = 32'hf1f031c1;
			8'hC2 : outS = 32'h40480848;
			8'hC3 : outS = 32'hc2c002c2;
			8'hC4 : outS = 32'h636c2f4f;
			8'hC5 : outS = 32'h313c3d0d;
			8'hC6 : outS = 32'h212c2d0d;
			8'hC7 : outS = 32'h40400040;
			8'hC8 : outS = 32'hb2bc3e8e;
			8'hC9 : outS = 32'h323c3e0e;
			8'hCA : outS = 32'hb0bc3c8c;
			8'hCB : outS = 32'hc1c001c1;
			8'hCC : outS = 32'ha2a82a8a;
			8'hCD : outS = 32'hb2b83a8a;
			8'hCE : outS = 32'h424c0e4e;
			8'hCF : outS = 32'h51541545;
			
			8'hD0 : outS = 32'h33383b0b;
			8'hD1 : outS = 32'hd0dc1ccc;
			8'hD2 : outS = 32'h60682848;
			8'hD3 : outS = 32'h737c3f4f;
			8'hD4 : outS = 32'h909c1c8c;
			8'hD5 : outS = 32'hd0d818c8;
			8'hD6 : outS = 32'h42480a4a;
			8'hD7 : outS = 32'h52541646;
			8'hD8 : outS = 32'h73743747;
			8'hD9 : outS = 32'ha0a02080;
			8'hDA : outS = 32'he1ec2dcd;
			8'hDB : outS = 32'h42440646;
			8'hDC : outS = 32'hb1b43585;
			8'hDD : outS = 32'h23282b0b;
			8'hDE : outS = 32'h61642545;
			8'hDF : outS = 32'hf2f83aca;
			
			8'hE0 : outS = 32'he3e023c3;
			8'hE1 : outS = 32'hb1b83989;
			8'hE2 : outS = 32'hb1b03181;
			8'hE3 : outS = 32'h939c1f8f;
			8'hE4 : outS = 32'h525c1e4e;
			8'hE5 : outS = 32'hf1f839c9;
			8'hE6 : outS = 32'he2e426c6;
			8'hE7 : outS = 32'hb2b03282;
			8'hE8 : outS = 32'h31303101;
			8'hE9 : outS = 32'he2e82aca;
			8'hEA : outS = 32'h616c2d4d;
			8'hEB : outS = 32'h535c1f4f;
			8'hEC : outS = 32'he0e424c4;
			8'hED : outS = 32'hf0f030c0;
			8'hEE : outS = 32'hc1cc0dcd;
			8'hEF : outS = 32'h80880888;
			
			8'hF0 : outS = 32'h12141606;
			8'hF1 : outS = 32'h32383a0a;
			8'hF2 : outS = 32'h50581848;
			8'hF3 : outS = 32'hd0d414c4;
			8'hF4 : outS = 32'h62602242;
			8'hF5 : outS = 32'h21282909;
			8'hF6 : outS = 32'h03040707;
			8'hF7 : outS = 32'h33303303;
			8'hF8 : outS = 32'he0e828c8;
			8'hF9 : outS = 32'h13181b0b;
			8'hFA : outS = 32'h01040505;
			8'hFB : outS = 32'h71783949;
			8'hFC : outS = 32'h90901080;
			8'hFD : outS = 32'h62682a4a;
			8'hFE : outS = 32'h22282a0a;
			8'hFF : outS = 32'h92981a8a;
			
			default : outS = 32'h00000000;
	 
  endcase

assign outS2 = outS;
  

endmodule