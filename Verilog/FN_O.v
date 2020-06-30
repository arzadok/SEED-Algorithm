/*
  This module receives the 128-bit ciphertext from every round,
  and trasfer the 128-bit ciphertext exactly after 16 rounds.
*/
module FN_O
(
  input      clk  ,            //internal 100MHz clock
  input      clk_en,         // sends pulse every 2 clock cycles
  input      reset,              // active high synchronous reset
  input      [3:0] Rounds ,      // number of rounds (16 rounds Algorithm)
  input [63:0] R,               // right 64-bit from the last round
  input [63:0] L,               // left 64-bit from the last round
  output [127:0] ciphertext,   // 128-bit ciphertext
  output     out_en           // when high - encryption over
 );
 
 // a small FSM to control the trasfer ciphertext process
 localparam WIDTH = 3;
 localparam IDLE  = 3'b001;
 localparam output_all = 3'b010;
 localparam output_cipher = 3'b100;
 
 reg [WIDTH-1 : 0] state;
 reg [127:0] Q;
 reg flag; 
 reg reg_out;
 
 always @ (posedge clk)
 if (reset)
   begin
     state    <= IDLE;
     Q        <= 128'b0;
     flag     <= 1'b0;
     reg_out  <= 1'b0;
   end
 else
 if(clk_en)
 begin
   case (state)
      IDLE : if (Rounds == 4'hf)  
	          begin
                flag <= 1'b1;
				state  <= IDLE;
			  end
            else 
			 if(flag)
			    state  <= output_all; 
			 else
			 begin
                state  <= IDLE;
                flag <= 1'b0;
             end
             
output_all :  if (flag)
              begin
                Q <= {L,R};
                reg_out <= 1'b1;
				flag <= 1'b0;
                state  <= output_cipher;
              end
            else
              begin
                state  <= IDLE;
                flag <= 1'b0;
              end
              
output_cipher: if (flag == 1'b0)
              begin
                reg_out <= 1'b0;
				state  <= output_cipher;
              end
			  else
			   begin
                state  <= IDLE;
                flag <= 1'b0;
               end
			  
   endcase
 end
 assign ciphertext = Q;
 assign out_en = reg_out;
 
endmodule

