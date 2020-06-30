/*
   The function F is the main function of the algorithm which is at the heart of Feistel Network. 
   A 64-bit input block of the round function F is divided into two 32-bit blocks (R0, R1)
   and wrapped in 4 phases. Firstly a mixing phase of two 32-bit subkey blocks (Ki0, Ki1)
   occur and then 3 layers of function G, with additions for mixing two 32-bit blocks take place.
   Function G has also two layers: a layer of S-boxes and a layer of XOR logic.
*/
module F
(
  input  clk,                  //internal 100MHz clock
  input reset,                 // active high synchronous reset
  input sync,                  // synchronous signal for the registers of the Fiestel Network
  input start_f,               // when high it means that Key is finish create all his SKs and ready to go
  input clk_en,                // clk_en to lower the frequency
  input      [63:0]  R_i,      // 64-bit that sends from module B
  input      [31:0]  Key_i_0,  // Sub-Key0
  input      [31:0]  Key_i_1,  // Sub-Key1
  output     [63:0]  F_out     // 64-bit trasfers the xor logic
);

//Input signals
wire  [31:0] r;
wire  [31:0] l;
wire  [31:0] ki_1;
wire  [31:0] ki_0;

//Output signals
//wire [31:0] r_out;
//wire [31:0] l_out;

//Input and Output of G function
wire [31:0] g1_in,g1_out; 
wire [31:0] g2_in,g2_out;
wire [31:0] g3_in,g3_out;

//
reg  [63:0] f_out;
reg  [31:0] G1_in,G2_in;
reg  [31:0] G3_in;
reg  [31:0] L_out;

//
assign ki_0 =  Key_i_0[31:0];
assign ki_1 =  Key_i_1[31:0];
assign l    =  R_i [63:32];
assign r    =  R_i [31:0];

// Design Hierarchy

G dutG1
(
.in_X (g1_in),
.out_Z (g1_out)
);

G dutG2
(
.in_X (g2_in),
.out_Z(g2_out)
);


G dutG3
(
.in_X (g3_in),
.out_Z(g3_out)
);

always @(*)
begin 
    G2_in <= g1_out + (l^ki_0);
    G3_in <= g2_out + g1_out;
    L_out <= g3_out + g2_out;
end

always @(posedge clk)
begin
if (reset)
begin
f_out <= 0 ;
G1_in <= 0 ;
end
else 
if(clk_en)
 begin
  if (start_f)
  begin
   if (sync == 0)
       G1_in <= (r^ki_1)^(l^ki_0);
   else
   if (sync)
    f_out <= {L_out,g3_out};	
   end
  end

end

 assign g1_in = G1_in;
 assign g2_in = G2_in;
 assign g3_in = G3_in;
 //assign l_out = L_out;
 //assign r_out = g3_out;
 assign F_out = f_out;
    
endmodule