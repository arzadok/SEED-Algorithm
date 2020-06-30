*Note: All the files can be found in the SEED Algorithm.zip file.

Team number: xohw20_117

Project name: FPGA Implementation of the SEED Encryption Algorithm

Date: 2020/06/30

Version of uploaded archive: 1

 

University name: Jerusalem College of Technology

Supervisor name: Uri Stroh

Supervisor e-mail: stroh@jct.ac.il

Participant(s): Ariel Zadok		

Email: gt1000az@gmail.com

 

Board used: Basys 3

Software Version: Vivado 2018.3, Vivado 2016.2, Verilog 2005.

Brief description of project:

The goal of the project was to design and implement encryption block cipher algorithm on an FPGA device.

The project was carried out on the basys3 board, a complete, 
ready-to-use digital circuit development platform based on the latest Artix-7 Field Programmable Gate Array (FPGA) from Xilinx. 

Raspberry Pi 3 for the user interface software.

As in many cases, one of the designer’s main challenges is to carefully maintain balance between Timing considerations and Area considerations. 
Therefore, I used Iterative Implementation. 
I manage to implement two operation modes – encryption and decryption, with a very friendly user interface software.
This implementation demonstrates a fair combination of the two factors.

Link to project repository:

https://github.com/arzadok/SEED-Algorithm

Description of archive (explain directory structure, documents and source files):

Directories:
 SEED_Algorith - all the relevant files, Top Level files, gate level simulation, RTL Synthesis, bitstream, etc.
 python code + contraints - python code file, XDC file.
 Components - other components with testbenches that may be relevant.
 Documents - some documents, diagrams, pictures.
 
files:
 README - the requested readme file.
 SEED Algorithm report - Project report.
 

FPGA Implementation of the SEED Encryption Algorithm:

To run this project, follow the steps:

1. make sure you have:

    a. Basys 3

    b. Raspberry Pi

    c. 23 jumper wires

2. connect between Basys 3 and Raspberry Pi with jumper wires as shown in the table. (Project Report - page number 49)

3. Program FPGA with the bitstream

4. Run the Python code

That's it, Have fun! :)
