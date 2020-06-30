/*
 This module is the "left register" of the Fiestel Network/
 In the first round his job is to store the 64 left Plaintext's bits till function F finished (sync = 1) and then send them to the xor logic.
 And in the other rounds his job is to get from module B the right 64-bit from last round and store them till function F finished (sync = 1) and send them to the xor logic.
 The input register are neessary in order to store the input data during the cipher operation.
*/
module A
(
  input  clk,               //internal 100MHz clock
  input reset,              // active high synchronous reset
  input sync,               // synchronous signal for the registers of the Fiestel Network
  input start_f,            // when high it means that Key is finish create all his SKs and ready to go
  input clk_en,             // sends pulse every 2 clock cycles
  input  [3:0] Rounds,      // number of rounds (16 rounds Algorithm)
  input  [63:0] begin_A,    // left 64-bit Plaintext
  input  [63:0] input_A,    // right 64-bit from last round
  output [63:0] output_xor  //send them to xor logic
);

reg [63:0] RegOut;
reg [63:0] xor_out;

//logic for the first round - Combinatorial logic
always @(*)
begin
   if (Rounds == 0)
    RegOut <= begin_A;
   else
    RegOut <= input_A;
 end    

//register hold the bits till function F finished - Sequential logic
always @(posedge clk)
begin
 if (reset ==1)
   xor_out <= 0;
 else 
 begin
 if(clk_en)
 begin
   if(start_f)
     begin
	   if (sync)
	      xor_out <= RegOut;
	  end
  end
 end
end
    


assign output_xor = xor_out;

  
endmodule