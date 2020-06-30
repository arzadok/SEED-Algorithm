/*
 This module generates the rounds of the algorithm and trasfers it to the whole system.
 Every two clk_en cycles we have a new round.
*/
module cntr
(
     input  clk,               //internal 100MHz clock
     input reset,              // active high synchronous reset
     input start,            // when high it means that Key is finish create all his SKs and ready to go
     input    clk_en,                // sends pulse every 2 clock cycles
     output  [3:0] Rounds     // number of rounds (16 rounds Algorithm)
);

reg [4:0] counter; // 5-bit counter

always@(posedge clk)
begin
if(reset)
 counter <= 5'd0;
else 
begin
if(clk_en)
 begin
 if (start)
 counter <= counter + 5'd1;
 end
end
end

assign Rounds = counter/2;

endmodule