/*
 This module has two layers: a layer of four 8x32 SS-boxes
 and a layar of one xor and concatenation.
*/
module G 
(
     input   [31:0] in_X,
     output  [31:0] out_Z
);
//Input signals
wire [7:0] x0;
wire [7:0] x1;
wire [7:0] x2;
wire [7:0] x3;

//Output signals
wire [31:0] z0;
wire [31:0] z1;
wire [31:0] z2;
wire [31:0] z3;

assign x0 = in_X[7:0] ;
assign x1 = in_X[15:8] ;
assign x2 = in_X[23:16] ;
assign x3 = in_X[31:24] ;

// Design Hierarchy

  SS0 U0( x0, z0 );
  SS1 U1( x1, z1 );
  SS2 U2( x2, z2 );
  SS3 U3( x3, z3 );


assign out_Z = z0 ^ z1 ^ z2 ^ z3; 

endmodule
