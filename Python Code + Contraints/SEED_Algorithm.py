import binascii
import time
import RPi.GPIO as GPIO
import codecs

GPIO.setmode(GPIO.BOARD)

##############

# GPIO
part_SEED = [8, 10, 12, 16, 18, 22, 24, 26]  # part of SEED Algorithm result
load_SEED = 36  # indicate to read part_SEED
part_msg = [19, 21, 23, 29, 31, 33, 35, 37]  # part of message
in_en = 5  # indicates that there are blocks to send
start = 7  # indicates that the first block was sent
load = 11  # load message
done = 40  # indicates that the encryption process is done
Enc_Dec = 13 #determines whether encryption or decryption is performed
Reset_SEED = 38 #synchronize reset
block = 128  # Block size
cipher = [''] * 128



def setup():  # setups and reset the pins.
    GPIO.setup(part_msg, GPIO.OUT)
    GPIO.setup(load, GPIO.OUT)
    GPIO.setup(start, GPIO.OUT)
    GPIO.setup(in_en, GPIO.OUT)
    GPIO.setup(Enc_Dec, GPIO.OUT)
    GPIO.setup(done, GPIO.IN)
    GPIO.setup(part_SEED, GPIO.IN)
    GPIO.setup(load_SEED, GPIO.IN)
    GPIO.setup(Reset_SEED, GPIO.IN)
    GPIO.output(part_msg, GPIO.LOW)
    GPIO.output(in_en, GPIO.LOW)
    GPIO.output(start, GPIO.LOW)
    GPIO.output(load, GPIO.LOW)
   

def recieve(num):  # recieve the result of SEED Algorithm

    for i in range(num):
        if GPIO.input(load_SEED) == 1:
            #print(GPIO.input(load_SEED))
            for j in range(8):
                cipher[j + i * 8] = GPIO.input(part_SEED[j])
            while GPIO.input(load_SEED) == 1:
                pass
            if i != num - 1:
                while GPIO.input(load_SEED) == 0:
                    pass
    return  cipher #list(map(str, cipher))


def pad(msg):  # padding the message
    if msg != "":
        if msg[0] == "0":
             msg = bin(int(msg, 16)).zfill(8)
             msg = msg.replace("b", "0000")  # terminating parasitic "b". (we know it's in binary!)
        elif msg[0] == "1":
                msg = bin(int(msg, 16)).zfill(8)
                msg = msg.replace("b", "00")  # terminating parasitic "b". (we know it's in binary!)
        elif msg[0] == "2" or msg[0] == "3":
                msg = bin(int(msg, 16)).zfill(8)
                msg = msg.replace("b", "0")  # terminating parasitic "b". (we know it's in binary!)
        elif msg[0] == "4" or msg[0] == "5" or msg[0] == "6":
                msg = bin(int(msg, 16)).zfill(8)
                msg = msg.replace("b", "")  # terminating parasitic "b". (we know it's in binary!)
        elif msg[0] == "7": # or msg[0] == "9":
                msg = bin(int(msg, 16)).zfill(8)
                msg = msg.replace("b", "")  # terminating parasitic "b". (we know it's in binary!)
                #msg = '0' + msg
        else: 
             msg = bin(int(msg, 16)).zfill(8)
             msg = msg.replace("b", "")  # terminating parasitic "b". (we know it's in binary!)
             msg = msg[1:129]
  
    tail = block - (len(msg)) #% block)
    if tail != 0:
       for i in range(tail):
           msg = msg + '0'
    #print(msg)
    return msg


def endian(msg, blocks):  # makes the message in little endian format
    tmp_msg = [''] * 256
    msg = list(msg)
    for j in range(blocks):
        for i in range(256 * j, 256 + 256 * j, 32):
            tmp_msg[i % 256: (i + 8) % 256: 1] = msg[i + 24: i + 32: 1]
            tmp_msg[(i + 8) % 256: (i + 16) % 256: 1] = msg[i + 16: i + 24: 1]
            tmp_msg[(i + 16) % 256: (i + 24) % 256: 1] = msg[i + 8: i + 16: 1]
            tmp_msg[(i + 24) % 256: (i + 32) % 256: 1] = msg[i: i + 8: 1]

        msg[256 * j: 256 + 256 * j:1] = tmp_msg[0:256:1]
    return list(map(int, msg))


def transmit(msg, blocks):  # Transmit the message in packages of 8 bits
    check = "".join(map(str,msg))
    #print(hex(int(check,2)))#msg = msg[::-1]#check = ['']
    GPIO.output(in_en, GPIO.HIGH)
    for j in range(blocks):
        for i in range (256 * j, 248 + 256 * j, 8):
            if j == 0:
             GPIO.output(start, GPIO.HIGH)
            for P in range(8):
                GPIO.output(part_msg[P], msg[ i + P])
               # check = ("{}{}".format(check,msg[i + P]))
            GPIO.output(load, GPIO.HIGH)
            	#	print ('\n')

            GPIO.output(load, GPIO.LOW)
            
        
        for i in range(248 + 256 * j, 256 + 256 * j):
            GPIO.output(part_msg[i % 8], msg[i])
           # check = ("{}{}".format(check,msg[i]))
            #print("your msg is: ", msg[i])

        GPIO.output(load, GPIO.HIGH)
        GPIO.output(load, GPIO.LOW)
      #  GPIO.output(start, GPIO.LOW)
   # print("your msg is: ", check,'/n' )
    GPIO.output(in_en, GPIO.LOW)


def main():
    setup()
    print ('\n', '\n', "  This is a hardware implementation for SEED Algorithm", '\n')
    print ('\n', "  Please enter a secret key cipher:   128bMax(16-Latters) ", '\n')
    valid = False
    while valid == False:
        Key = input("  ")
        if (len(Key) <= 32) :
            valid = True
        else:
            valid = False
        if valid == False:
            print('\n', " The Key is over the Max-bits(128).", '\n', '\n', "  Please choose again correctly")
    print('\n', "  Please enter a Plaintext:   128bMax(16-Latters) ", '\n')
    valid1 = False
    while valid1 == False:
        Plaintext = input("  ")
        if (len(Plaintext) <= 32):
            valid1 = True
        else:
            valid1 = False
        if valid1 == False:
            print('\n', " The Plaintext is over the Max-bits(128).", '\n', '\n', "  Please choose again correctly")
    print('\n', "  Please set the mode:  ", '\n',"The options are: ",'\n', '\n', "  1 -- Encryption",'\n',"  2 -- Decryption")
    valid1 = False
    while valid1 == False:
        Enc_dec = input("  ")
        if (Enc_dec == "1" or Enc_dec == "2" ):
            valid1 = True
        else:
            valid1 = False
        if valid1 == False:
            print('\n', "  The option: ", Enc_dec, " is none of the options listed above.", '\n' ,'\n', "  Please choose again correctly")
    Key = pad(Key)
    Plaintext = pad(Plaintext)
    msg = Plaintext + Key
    blocks = 1
    #msg = endian(msg, blocks)
    print('\n', "Please press on the center button of the Basys 3 to start :)")
    msg = "".join(map(str,msg))
    m = ['']*32
    for i in range (32):
        m[i] = msg[i*8:8+(i*8)]
        m[i] = m[i][::-1]
    #new_msg = [m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16]
    m = "".join(map(str,m))
    GPIO.wait_for_edge(Reset_SEED, GPIO.RISING)
    time.sleep(1)
    m = list(map(int, m))
    if Enc_dec == '1':
        print('\n', "  starting encryption... ")
        GPIO.output(Enc_Dec, GPIO.HIGH)
    else:
        print('\n', "  starting decryption... ")
        GPIO.output(Enc_Dec, GPIO.LOW)
    transmit(m, blocks)  
    if GPIO.input(done) == 1:
       cipher = recieve(16)
       final_answer = "".join(map(str,cipher))
       c1 = final_answer[0:8]
       c2 = final_answer[8:16]
       c3 = final_answer[16:24]
       c4 = final_answer[24:32]
       c5 = final_answer[32:40]
       c6 = final_answer[40:48]
       c7 = final_answer[48:56]
       c8 = final_answer[56:64]
       c9 = final_answer[64:72]
       c10 = final_answer[72:80]
       c11 = final_answer[80:88]
       c12 = final_answer[88:96]
       c13 = final_answer[96:104]
       c14 = final_answer[104:112]
       c15 = final_answer[112:120]
       c16 = final_answer[120:128]
       
       c1 = c1[::-1]
       c2 = c2[::-1]
       c3 = c3[::-1]
       c4 = c4[::-1]
       c5 = c5[::-1]
       c6 = c6[::-1]
       c7 = c7[::-1]
       c8 = c8[::-1]
       c9 = c9[::-1]
       c10 = c10[::-1]
       c11 = c11[::-1]
       c12 = c12[::-1]
       c13 = c13[::-1]
       c14 = c14[::-1]
       c15 = c15[::-1]
       c16 = c16[::-1]

       new_cipher = [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16]
       final_answer = "".join(map(str,new_cipher))
       final = hex(int(final_answer,2))
       final = final.replace("0x", "")
       #print(" ", final, '\n', '\n')
       if Enc_dec == '1':
          print('\n', '\n', "  The Encryption result of SEED Algorithm is: ", '\n')
          print(" ", final, '\n', '\n')
       else:
          print('\n', '\n', "  The Decryption result of SEED Algorithm is: ", '\n')
          print(" ", final, '\n', '\n')         
       GPIO.output(part_msg, GPIO.LOW)
       GPIO.cleanup()

main()
