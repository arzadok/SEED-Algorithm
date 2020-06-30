/*
 In this module all the encryption and decryption executed.
 His execution requires 16 loops of this single round. The execution
 time of each round is one clk_en clock cycle. The output of each round is used as input 
 (through module B) of the next round. The output of the left branch is used as input 
 in the next left branch (through module A).
 *** The signal Enc_Dec determines whether encryption or decryption is performed.
*/
module SEED
(
input           clk,reset,
input           start1,Enc_Dec,
input  [127:0]  plaintext,
input [127:0]   key,
output [127:0]  ciphertext,
output out_en
);

reg r_start;

always@(*)
begin
if(reset)
  r_start <= 0;
else
if(start1)
   r_start <= 1;
end


assign start = r_start;

wire sync,start_sys,clk_en;
wire [3:0] Rounds;
wire [31:0] K0,K1;

//Design Hierarchy

clk_en  dut_clk_en
(
.clk  (clk),
.reset (reset),
.start(start),
.clk_en(clk_en)
);

cntr dut_cntr
(
.clk     (clk)  , 
.clk_en  (clk_en),
.reset   (reset), 
.start   (start_sys),
.Rounds  (Rounds)
);

synchronous synch
(
.clk     (clk)  , 
.reset   (reset), 
.start   (start),
.clk_en  (clk_en),
.sync    (sync)
);

KeySch Key 
(
.clk     (clk)  , 
.reset   (reset), 
.sync    (sync), 
.start   (start),
.Enc_Dec (Enc_Dec),
.clk_en  (clk_en),
.start_sys  (start_sys), 
.key_In  (key),
.key_out1 (K0),
.key_out2 (K1)
);

Feistel_Network FN
(
.clk     (clk)  , 
.reset   (reset), 
.sync    (sync), 
.start_f (start_sys),
.clk_en  (clk_en),
.Rounds  (Rounds), 
.plaintext (plaintext),
.ki_0   (K0), 
.ki_1   (K1),
.ciphertext (ciphertext),
.out_en      (out_en)
);


endmodule






























