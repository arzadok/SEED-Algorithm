/*
This is the Top-Level module of the implementation. 
It is doing all the encryption/decryption operations 
and of course the receiving and transmitting operations from/and the raspberry pi. 
*/
module Top_Level
(
input           clk,reset,in_en,
input           start,load,Enc_Dec,
input  [7:0]    part_msg,
output [7:0]    part_SEED,
output          load_rpi3,done,reset_out
);



wire  start_SEED,out_en;
wire [127:0] plaintext,key,SEED_out;

//Design Hierarchy

byte_to_256 dut_byte_to_256
(
.clk     (clk)  , 
.reset   (reset), 
.in_en   (in_en),
.start1  (start),
.load1   (load),
.part_msg1(part_msg),
.plaintext(plaintext),
.key    (key),
.done    (start_SEED)
);

SEED  dut_SEED
(
.clk       (clk)  , 
.reset     (reset), 
.start1     (start_SEED),
.Enc_Dec   (Enc_Dec),
.plaintext (plaintext),
.key       (key),
.ciphertext(SEED_out),
.out_en    (out_en)
);

SEED2B dut_SEED2B 
(
.clk       (clk)  , 
.reset     (reset), 
.in_en     (in_en),
.start1    (start),
.SEED      (SEED_out), 
.out_en    (out_en),
.part_SEED (part_SEED),
.load_rpi3 (load_rpi3),
.done      (done)
);

reset_out dut_reset_out
(
.clk   (clk),
.reset   (reset),
.level_fall_reset   (reset_out)
);
endmodule






























