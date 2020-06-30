/*
  This module has too parts, Combinatorial logic and Sequential logic.
  The combinatorial logic is for the first round, the module takes the right 64-bit Plaintext and sends them to F function.
  The Sequential logic is holding the bits till function F will finish his round (sync == 1) then sends the bits to module A.
  The input register are neessary in order to store the input data during the cipher operation.
*/
module B
(
  input  clk,                 //internal 100MHz clock
  input  reset,               // active high synchronous reset
  input  sync,                // synchronous signal for the registers of the Fiestel Network
  input  start_f,             // when high it means that Key is finish create all his SKs and ready to go
  input  clk_en,              // sends pulse every 2 clock cycles
  input  [3:0] Rounds,        // number of rounds (16 rounds Algorithm)
  input  [63:0] begin_B,      // right 64-bit Plaintext
  input  [63:0] input_B,      // 64-bit output from the xor logic
  output [63:0] output_F,     // 64-bit that sends to F function
  output [63:0] output_end    // 64-bit that sends to be hold till F function will finish 
);


reg [63:0] RegOut;
reg [63:0] RegOut2;


// First part - the Combinatorial logic
always @(*)
begin
   if (Rounds == 0)
    RegOut <= begin_B;
   else
    RegOut <= input_B;
 end    

// Second part - the Sequential logic
always @(posedge clk)
begin
 if (reset)
   RegOut2 <= 0;
 else 
 if(clk_en)
 begin
   if(start_f)
     begin
	   if (sync)
	      RegOut2 <= RegOut;
	  end
 end
end



assign output_F = RegOut;


assign output_end = RegOut2;






/*
localparam WIDTH = 2;
localparam Begin  = 2'b01;
localparam Input = 2'b10;

 
reg [WIDTH-1 : 0] state;
reg [63:0] RegOut;
//reg [63:0] RegOut2;

 
 always @ (*)
 if (reset)
   begin
     state    <= Begin;
     RegOut     <= 64'b0;
   end
 else
   case (state)
         Begin : if(start_f == 0)
		          begin
                   RegOut <= begin_B;
				   state  <= Begin;
				  end
                 else
                  if (Rounds == 0)
				    state <= Input;
	       
         Input :  if(sync)
                  begin
	                RegOut <= input_B;
					state <= Input;
				  end
   endcase
   
   assign output_F = RegOut;
  /* always @(posedge clk)
begin
if (reset)
  RegOut2 <= 0;
else
begin
  if(start_f)
   begin 
    if(sync)
	   RegOut2 <= RegOut;
   end
  end
end  
assign output_F = RegOut;

/*
always @(*)
begin
if(reset)
begin
 flag = 0;
 RegOut = 0;
end
else
begin
  if(start_f == 0)
     RegOut = begin_B;
  else
  if (Rounds == 0)
	begin
	if(sync)
	  RegOut = input_B;
	end
   else
	RegOut = input_B;
	end
end    

    
always @(posedge clk)
begin
if (reset)
  RegOut2 <= 0;
else
begin
  if(start_f)
   begin 
    if(sync)
	   RegOut2 <= RegOut;
   end
  end
end
	   

assign output_F = RegOut;


//registers in order to synchronize the data execution
//register64_sync R_end( RegOut, clk, reset, sync, RegOut2);

assign output_end = RegOut2;
*/
endmodule
  