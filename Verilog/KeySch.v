/*
  This module is the "Key" of the Algorithm, it recives the 128-bit cipher key from the user, generates 32 Sub-Keys and transfers them to the Fiestel Network.
  The 128-bit cipher key is divided into four 32-bit blocks (Key0, Key1, Key2 and Key3).
  These blocks are proessed by two types of registers: four registers that trasfer when sync = 0, two registers that trasfer when sync = 1,
  4 muxes, 16 rounds of addition/subtraction with round coefficients, 
  8-bit left/right rotation, and the G-function in order to generate keys for all 16-rounds.
*/
module KeySch
(
  input  clk,                   //internal 100MHz clock
  input  reset,                 // active high synchronous reset
  input  sync,                  // synchronous signal for the registers of the Fiestel Network
  input  start,                 // when high - you can start encrypting 
  input  clk_en,                // sends pulse every 2 clock cycles
  input            Enc_Dec,     //when high - encrypting, when low - decrypting
  input    [127:0] key_In,      // 128-bit cipher key
  output           start_sys,   // when high - Fiestel Network start encrypting
  output    [31:0] key_out1,    //32-bit Sub-Key0
  output    [31:0] key_out2     //32-bit Sub-Key1
);

// Constants KCi
integer KC0;
integer KC1;
integer KC2;
integer KC3;
integer KC4;
integer KC5;
integer KC6;
integer KC7;
integer KC8;
integer KC9;
integer KCA;
integer KCB;
integer KCC;
integer KCD;
integer KCE;
integer KCF;

//set values
initial 
 begin
  KC0   <= 32'h9e3779b9;
  KC1   <= 32'h3c6ef373;
  KC2   <= 32'h78dde6e6;
  KC3   <= 32'hf1bbcdcc;
  KC4   <= 32'he3779b99;
  KC5   <= 32'hc6ef3733;
  KC6   <= 32'h8dde6e67;
  KC7   <= 32'h1bbcdccf;
  KC8   <= 32'h3779b99e;
  KC9   <= 32'h6ef3733c;
  KCA   <= 32'hdde6e678;
  KCB   <= 32'hbbcdccf1;
  KCC   <= 32'h779b99e3;
  KCD   <= 32'hef3733c6;
  KCE   <= 32'hde6e678d;
  KCF   <= 32'hbcdccf1b;
end

//Input signals
wire [31:0] a0;
wire [31:0] a1;
wire [31:0] a2;
wire [31:0] b0;
wire [31:0] b1;
wire [31:0] b2;
wire [31:0] c0;
wire [31:0] c1;
wire [31:0] c2;
wire [31:0] d0;
wire [31:0] d1;
wire [31:0] d2;


//reg[1:0] selectAB;

//reg[1:0] selectCD;
reg [3:0] selectABCD;

//Input for the mux(reg/wire)
wire[1:0] select_A;
wire[1:0] select_B;
wire[1:0] select_C;
wire[1:0] select_D;

// the third Input for the Muxes
wire [63:0] EvenAB;
wire [63:0] OddCD;

// additiion/suctraction with round coefficients
wire [31:0] x1;
reg  [31:0] x2;
wire [31:0] y1;
reg  [31:0] y2;

//G function Outputs
wire [31:0] Q_out1;
wire [31:0] Q_out2;

//registers Outputs trasfered when sync = 1
wire [31:0] key_o1;
wire [31:0] key_o2;

//gets the Sub-Keys from the key vector
reg [31:0] key_O1;
reg [31:0] key_O2;

//when 33 start_Rsys is high
reg [5:0] cntr;

//when high - Feister Network start encrypting
reg start_Rsys;

//Mux Outputs signals
wire [31:0] Aout;
wire [31:0] Bout;
wire [31:0] Cout;
wire [31:0] Dout;

//registers (sync = 0) Outputs
wire [31:0] A_out;
wire [31:0] B_out;
wire [31:0] C_out;
wire [31:0] D_out;

// left 64-bit goes to shift right 
wire [63:0] AB;
// right 64-bit goes to shift left 
wire [63:0] CD;


//Decryption vector
reg [1023:0] key_vec;

//when high key stop encrypting
reg key_stop;

reg [2:0] flag; // delay counter

wire [3:0] Rounds_key; //key's rounds when encrypting

wire [3:0] internal_Rounds; // key's rounds when transfering

// Design Hierarchy
//Muxes
Mux3_1 A(
.select (select_A), 
.m0     (a0),
.m1     (a1), 
.m2     (a2), 
.RegOut (Aout)
);

Mux3_1 B(
.select (select_B), 
.m0     (b0),
.m1     (b1), 
.m2     (b2), 
.RegOut (Bout)
);

Mux3_1 C(
.select (select_C), 
.m0     (c0),
.m1     (c1), 
.m2     (c2), 
.RegOut (Cout)
);

Mux3_1 D(
.select (select_D), 
.m0     (d0),
.m1     (d1), 
.m2     (d2), 
.RegOut (Dout)
);

//registers in order to synchronize the data execution, trasfers when sync = 1
register32_sync Rx( Q_out1, clk, clk_en, reset, start, sync, key_o1);
register32_sync Ry( Q_out2, clk, clk_en, reset, start, sync, key_o2);

//registers at the end of the muxes, trasfers when sync = 0

register32 RA( Aout, clk, clk_en, reset, start, sync, A_out);
register32 RB( Bout, clk, clk_en, reset, start, sync, B_out);
register32 RC( Cout, clk, clk_en, reset, start, sync, C_out);
register32 RD( Dout, clk, clk_en, reset, start, sync, D_out);


//G - functions
 G G1( x2, Q_out1);//
 G G2( y2, Q_out2);//

//the first inputs of the muxes
assign a0 = key_In[127:96];
assign b0 = key_In[95:64];
assign c0 = key_In[63:32];
assign d0 = key_In[31:0];

//the select bit for every mux
assign select_A = selectABCD[3:2];
assign select_B = selectABCD[3:2];
assign select_C = selectABCD[1:0];
assign select_D = selectABCD[1:0];

//the second inputs of the muxes
assign a1 = A_out;
assign b1 = B_out;
assign c1 = C_out;
assign d1 = D_out;

//the third inputs of the muxes
assign a2 = EvenAB[63:32];
assign b2 = EvenAB[31:0];
assign c2 = OddCD[63:32];
assign d2 = OddCD[31:0];


assign x1 = A_out + C_out;
assign y1 = B_out - D_out;

assign start_sys = start_Rsys;

assign key_out1 = key_O1;
assign key_out2 = key_O2;


reg [4:0] counter;
reg [1:0] flag_sys;
reg key_start;

always @(posedge clk)
 begin 
  if(reset)
	 key_start <= 0;
  else
  if(clk_en)
  begin
  if(key_stop)
     key_start <= 1;
  end
end
	 
always@(posedge clk)
begin
if(reset)
begin
 counter <= 5'd0;
 flag_sys <= 2'd0;
 start_Rsys <= 0;
end
else 
if(clk_en)
begin
if (key_start)
 begin
 counter <= counter + 5'd1;
 flag_sys <= flag_sys +1;
 if(flag_sys == 2'h1)
    start_Rsys <= 1;
 end
end

end

assign internal_Rounds = counter/2; 

//reg [3:0] flag_rounds;
 
 always @( posedge clk)
  begin
    if (reset)
    begin
      cntr <= 0;
	  key_stop <= 0;
	  flag <= 0;
    end
    else
	if(clk_en)
    begin
    if(start) 
    begin
	if(flag == 3'd1)
	begin
      cntr <= cntr + 5'd1;
	  if(cntr == 6'd33)
	  begin
	   key_stop <= 1;
	  end
	end
    else
    flag <= flag + 1;
	end
	end
   end
 
 assign Rounds_key = cntr/2;
 
 
 always @(posedge clk)
  begin 
     if(reset == 1)
     begin
     x2 <= 0;
     y2 <= 0;
	 key_vec[1023:0] <= 0;
	 selectABCD <= 0;
     end
  else
  if(clk_en)
  begin
  if (key_stop == 0)
  begin
  if (start == 1) 
   begin
   case( Rounds_key )
       4'h0 : begin
       x2 <= x1 - KC0;
       y2 <= y1 + KC0;
	   key_vec[1023:960] <= {key_o1,key_o2};
	   selectABCD <= 4'h9;
     end 
     
       4'h1 : begin
	   key_vec[63:0] <= {key_o1,key_o2};
       x2 <=x1 - KC1;
       y2 <=y1 + KC1;
	   selectABCD <= 4'h6;
     end
     
       4'h2 : begin  
	   key_vec[127:64] <= {key_o1,key_o2};
       x2 <=x1 - KC2;
       y2 <=y1 + KC2;
	  selectABCD <= 4'h9;
     end 
     
       4'h3 : begin
	   key_vec[191:128] <= {key_o1,key_o2};
       x2 <=x1 - KC3;
       y2 <=y1 + KC3;
	   selectABCD <= 4'h6;
     end
     
       4'h4 : begin  
	   key_vec[255:192] <= {key_o1,key_o2};
       x2 <=x1 - KC4;
       y2 <=y1 + KC4;
	   selectABCD <= 4'h9;
     end
     
       4'h5 : begin 
	   key_vec[319:256] <= {key_o1,key_o2};
       x2 <=x1 - KC5;
       y2 <=y1 + KC5;
	   selectABCD <= 4'h6;
     end
     
       4'h6 : begin
	   key_vec[383:320] <= {key_o1,key_o2};
       x2 <=x1 - KC6;
       y2 <=y1 + KC6;
	   selectABCD <= 4'h9;
     end
      
       4'h7 : begin 
	   key_vec[447:384] <= {key_o1,key_o2};
       x2 <=x1 - KC7;
       y2 <=y1 + KC7;
	   selectABCD <= 4'h6;
     end
         
       4'h8 : begin
	   key_vec[511:448] <= {key_o1,key_o2};
       x2 <=x1 - KC8;
       y2 <=y1 + KC8;
	   selectABCD <= 4'h9;
     end
     
       4'h9 : begin 
	   key_vec[575:512] <= {key_o1,key_o2};
       x2 <=x1 - KC9;
       y2 <=y1 + KC9;
	   selectABCD <= 4'h6;
     end
     
       4'hA : begin
       key_vec[639:576] <= {key_o1,key_o2};
       x2 <=x1 - KCA;
       y2 <=y1 + KCA;
	   selectABCD <= 4'h9;
     end 
     
       4'hB : begin 
	    key_vec[703:640] <= {key_o1,key_o2};
       x2 <=x1 - KCB;
       y2 <=y1 + KCB;
	   selectABCD <= 4'h6;
     end
     
       4'hC : begin 
	    key_vec[767:704] <= {key_o1,key_o2};
       x2 <=x1 - KCC;
       y2 <=y1 + KCC;
	   selectABCD <= 4'h9;
     end
     
       4'hD : begin 
	   key_vec[831:768] <= {key_o1,key_o2};
       x2 <=x1 - KCD;
       y2 <=y1 + KCD;
	   selectABCD <= 4'h6;
     end
     
       4'hE : begin
	   key_vec[895:832] <= {key_o1,key_o2};
       x2 <=x1 - KCE;
       y2 <=y1 + KCE;
	   selectABCD <= 4'h9;
     end
     
       4'hF : begin 
	   key_vec[959:896] <= {key_o1,key_o2};
       x2 <=x1 - KCF;
       y2 <=y1 + KCF;
	   selectABCD <= 4'h6;
     end
    endcase
   end
  end
 end
end

 assign AB ={A_out, B_out};
 assign EvenAB ={AB[7:0], AB[63:8]};
 assign CD ={C_out, D_out};
 assign OddCD ={CD[55:0], CD[63:56]};
  
	 
reg [4:0] cnt; 
always @(posedge clk)
 begin 
  if(reset == 1)
     begin
     key_O1 <=0;
     key_O2 <=0;
	 cnt <= 0;
     end
  else
  if(clk_en)
  begin
  if ((key_stop) && (cnt <= 5'hf))
  begin
  if ((start == 1) && (sync == 1))
   begin
   case( internal_Rounds )
        4'h0 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[63:32];
			   key_O2 <= key_vec[31:0];
			   cnt <= cnt + 1;
			   end
			   else
			   begin
               key_O1 <= key_vec[1023:992];
			   key_O2 <= key_vec[991:960];
			   cnt <= cnt + 1;
               end 	  
               end 
	    4'h1 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[127:96];
			   key_O2 <= key_vec[95:64];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[959:928];
			   key_O2 <= key_vec[927:896];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'h2 : begin
			   if (Enc_Dec)
			   begin
               key_O1 <= key_vec[191:160];
			   key_O2 <= key_vec[159:128];

               end 
			   else
			   begin
               key_O1 <= key_vec[895:864];
			   key_O2 <= key_vec[863:832];
			   
               end 	  
               end 
		4'h3 : begin
		 	   if (Enc_Dec)
			   begin
               key_O1 <= key_vec[255:224];
			   key_O2 <= key_vec[223:192];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[831:800];
			   key_O2 <= key_vec[799:768];
			   cnt <= cnt + 1;
               end 	  
               end 
	    4'h4 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[319:288];
			   key_O2 <= key_vec[287:256];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[767:736];
			   key_O2 <= key_vec[735:704];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'h5 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[383:352];
			   key_O2 <= key_vec[351:320];
			   cnt <= cnt + 1;
               end 	
               else
			   begin
               key_O1 <= key_vec[703:672];
			   key_O2 <= key_vec[671:640];
			   cnt <= cnt + 1;
               end 	  
               end 			   
		 4'h6 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[447:416];
			   key_O2 <= key_vec[415:384];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[639:608];
			   key_O2 <= key_vec[607:576];
			   cnt <= cnt + 1;
               end 	  
               end 
	    4'h7 : begin
		      if (Enc_Dec)
			   begin
               key_O1 <= key_vec[511:480];
			   key_O2 <= key_vec[479:448];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[575:544];
			   key_O2 <= key_vec[543:512];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'h8 : begin
		      if (Enc_Dec)
			   begin
               key_O1 <= key_vec[575:544];
			   key_O2 <= key_vec[543:512];
			   cnt <= cnt + 1;
               end 	
               else
			   begin
               key_O1 <= key_vec[511:480];
			   key_O2 <= key_vec[479:448];
			   cnt <= cnt + 1;
               end 	  
               end             			   
         4'h9 : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[639:608];
			   key_O2 <= key_vec[607:576];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[447:416];
			   key_O2 <= key_vec[415:384];
			   cnt <= cnt + 1;
               end 
               end 	  
	    4'ha : begin
		      if (Enc_Dec)
			   begin
               key_O1 <= key_vec[703:672];
			   key_O2 <= key_vec[671:640];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[383:352];
			   key_O2 <= key_vec[351:320];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'hb : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[767:736];
			   key_O2 <= key_vec[735:704];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[319:288];
			   key_O2 <= key_vec[287:256];
			   cnt <= cnt + 1;
               end 	  
               end 
		4'hc : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[831:800];
			   key_O2 <= key_vec[799:768];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[255:224];
			   key_O2 <= key_vec[223:192];
			   cnt <= cnt + 1;
               end 	  
               end 
	    4'hd : begin
		       if (Enc_Dec)
			   begin
               key_O1 <= key_vec[895:864];
			   key_O2 <= key_vec[863:832];
			   cnt <= cnt + 1;
               end 
			   else
			   begin
               key_O1 <= key_vec[191:160];
			   key_O2 <= key_vec[159:128];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'he : begin
		      if (Enc_Dec)
			   begin
               key_O1 <= key_vec[959:928];
			   key_O2 <= key_vec[927:896];
			   cnt <= cnt + 1;
               end 	 
			   else
			   begin
               key_O1 <= key_vec[127:96];
			   key_O2 <= key_vec[95:64];
			   cnt <= cnt + 1;
               end 	  
               end 
        4'hf : begin
		      if (Enc_Dec)
			   begin
               key_O1 <= key_vec[1023:992];
			   key_O2 <= key_vec[991:960];
			   cnt <= cnt + 1;
               end 	  
			   else
			   begin
               key_O1 <= key_vec[63:32];
			   key_O2 <= key_vec[31:0];
			   cnt <= cnt + 1;
               end 	  
               end 
           endcase
         end
        end
      end		 
end

endmodule

