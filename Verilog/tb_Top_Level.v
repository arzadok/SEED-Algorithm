`timescale 1 ns / 1 ns

module tb_Top_Level
();

reg           tb_clk,tb_reset,tb_start,tb_in_en,tb_load,tb_Enc_Dec;
reg  [7:0]    tb_part_msg;
wire [7:0]    tb_part_SEED;
wire          tb_load_rpi3, tb_done, tb_reset_out;


always
begin
#5  tb_clk  <= ~tb_clk;
end


initial begin
/*
$display ("time\t\t Rounds     sync         key_out1                key_out2                         B2F                             B2A                              A2X                    F2X                   X2B");
$monitor ("%g\t\t %h           %h           %h                   %h                    %h                  %h        %h       %h         %h           ",
           $time, DUT.Rounds,DUT.synch.sync,DUT.Key.key_vec[63:0],DUT.Key.key_In, DUT.FN.B2F, DUT.FN.B2A, DUT.FN.A2X,DUT.FN.F2X, DUT.FN.X2B);


$display ("time\t\t clk    reset      in_en       pulse_start      load_msg       done_en     part_msg1                   tmp_msg                   msg               done ");
$monitor ("%g\t\t   %h     %h           %h           %h               %h              %h        %h               %h           %h                   %h          ",
           $time,DUT.clk, DUT.reset, DUT.in_en, DUT.dut_byte_to_256.pulse_start, DUT.dut_byte_to_256.load_msg, DUT.dut_byte_to_256.done_en ,DUT.dut_byte_to_256.part_msg1,DUT.dut_byte_to_256.tmp_msg, DUT.dut_byte_to_256.reg_msg, DUT.dut_byte_to_256.done);
*/
    tb_part_msg  <= 8'h00;
    //tb_key <= 128'h4706480851E61BE85D74BFB3FD956185; 
	// tb_plaintext  <= 128'h83A2F8A288641FB9A4E9A5CC2F131C7D;
    tb_clk     <= 0;
    tb_reset   <= 1;
	tb_in_en  <= 0;
	tb_start   <= 0;
	tb_Enc_Dec <= 1;
	tb_load   <= 0;
#113 tb_reset   <= 0;
#15 tb_in_en  <= 1;
#15 tb_start  <= 1;

#10 tb_part_msg   <= 8'h83;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hA2;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hF8;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hA2;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h88;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h64;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h1F;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hB9;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hA4;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hE9;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hA5;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hCC;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h2F;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h13;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h1C;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h7D;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h47;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h06;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h48;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h08;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h51;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hE6;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h1B;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hE8;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h5D;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h74;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hBF;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hB3;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'hFD;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h95;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h61;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
#10 tb_part_msg   <= 8'h85;
#10 tb_load   <= 1;
#10 tb_load   <= 0;
//#10 tb_start  <= 0;
//#10 tb_in_en   <= 0;


       
end


Top_Level DUT
(
.clk      (tb_clk),
.reset      (tb_reset)    ,
.in_en    (tb_in_en)  ,
.start    (tb_start)  ,
.Enc_Dec   (tb_Enc_Dec),
.load    (tb_load)    ,
.part_msg    (tb_part_msg)  ,
.part_SEED   (tb_part_SEED),
.load_rpi3      (tb_load_rpi3)  ,
.done         (tb_done),
.reset_out   (tb_reset_out)
);


endmodule
