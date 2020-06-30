/*
 This module helps the Key schedule to decide which input to trasfer 
 respectively for each round.
*/
module Mux3_1(

input  [1:0] select,
input  [31:0] m0,
input  [31:0] m1,
input  [31:0] m2,
output [31:0] RegOut
);

reg [31:0] regOut;

always @( * )
begin
   case( select )
       0 : regOut <= m0;
       1 : regOut <= m1;
       2 : regOut <= m2;
	   default: regOut <= m0;
   endcase
end

assign RegOut = regOut;

endmodule