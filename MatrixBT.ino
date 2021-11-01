#include <MaxMatrix.h>


int DIN = 10;
int CS =  9;
int CLK = 8;
long int cmd = -1;
int flag = 0;
int maxInUse = 1;
int i;
int z;

String deneme[64] = {};

MaxMatrix m(DIN, CS, CLK, maxInUse);

const unsigned char  A[] = {8, 8,
                            B00110000,
                            B01100110,
                            B11000110,
                            B11000000,
                            B11000000,
                            B11000110,
                            B01100110,
                            B00110000,

                           };

const unsigned char  B[] = {8, 8,
B00111000,
B00101000,
B01101110,
B01100010,
B00100010,
B01101110,
B01101000,
B00111000,


                           };   
const unsigned char  C[] = {8, 8,
B00001000,
B00001100,
B00001110,
B11111111,
B11111111,
B00001110,
B00001100,
B00001000,

                           };
                           const unsigned char  D[] = {8, 8,
B00010000,
B00110000,
B01110000,
B11111111,
B11111111,
B01110000,
B00110000,
B00010000,


                           };
                           const unsigned char  F[] = {8, 8,
B00011000,
B00111100,
B01111110,
B11111111,
B00011000,
B00011000,
B00011000,
B00011000,


                           };
                           const unsigned char  G[] = {8, 8,
B00011000,
B00011000,
B00011000,
B00011000,
B11111111,
B01111110,
B00111100,
B00011000,


                           };                                                   

void setup() {
  
m.init();
m.setIntensity(7);
 Serial1.begin(9600);
for(i=0;i<65;i++){
  deneme[i] = i;
  }   
}

void loop() {
 String outMsg;
  int incomingByte;
  byte byteCounter = 0;
  byte words[64];
 if(Serial1.available()>0){
  
  flag = 1;
  }

  cmd = Serial1.read();
if(flag == 1){
 
  
  
  delay(500);  
  Serial1.write(" Veri Var"); 
 
    incomingByte = Serial1.read();
    while (incomingByte > 0){
        words[byteCounter++] = incomingByte;
        Serial1.print(incomingByte,DEC);    
        incomingByte = Serial1.read();
        Serial1.print(" ");
      } // while
      Serial1.println("");
      for (int x = 0; x < byteCounter; x++){
        
        outMsg += char(words[x]);
        
      } // for
  
  
   
    
     
      if(outMsg == deneme[0]+"+1"){
    m.setDot(0,0,true);
    }else if(outMsg == deneme[0]+"+0"){
       m.setDot(0,0,false);
      } 
       if(outMsg == deneme[1]+"+1"){
    m.setDot(1,0,true);
    }else if(outMsg == deneme[1]+"+0"){
       m.setDot(1,0,false);
      } 
       if(outMsg == deneme[2]+"+1"){
    m.setDot(2,0,true);
    }else if(outMsg == deneme[2]+"+0"){
       m.setDot(2,0,false);
      } 
       if(outMsg == deneme[3]+"+1"){
    m.setDot(3,0,true);
    }else if(outMsg == deneme[3]+"+0"){
       m.setDot(3,0,false);
      } 
       if(outMsg == deneme[4]+"+1"){
    m.setDot(4,0,true);
    }else if(outMsg == deneme[4]+"+0"){
       m.setDot(4,0,false);
      } 
       if(outMsg == deneme[5]+"+1"){
    m.setDot(5,0,true);
    }else if(outMsg == deneme[5]+"+0"){
       m.setDot(5,0,false);
      } 
       if(outMsg == deneme[6]+"+1"){
    m.setDot(6,0,true);
    }else if(outMsg == deneme[6]+"+0"){
       m.setDot(6,0,false);
      } 
       if(outMsg == deneme[7]+"+1"){
    m.setDot(7,0,true);
    }else if(outMsg == deneme[7]+"+0"){
       m.setDot(7,0,false);
      } 



            if(outMsg == deneme[8]+"+1"){
    m.setDot(0,1,true);
    }else if(outMsg == deneme[8]+"+0"){
       m.setDot(0,1,false);
      } 
       if(outMsg == deneme[9]+"+1"){
    m.setDot(1,1,true);
    }else if(outMsg == deneme[9]+"+0"){
       m.setDot(1,1,false);
      } 
       if(outMsg == deneme[10]+"+1"){
    m.setDot(2,1,true);
    }else if(outMsg == deneme[10]+"+0"){
       m.setDot(2,1,false);
      } 
       if(outMsg == deneme[11]+"+1"){
    m.setDot(3,1,true);
    }else if(outMsg == deneme[11]+"+0"){
       m.setDot(3,1,false);
      } 
       if(outMsg == deneme[12]+"+1"){
    m.setDot(4,1,true);
    }else if(outMsg == deneme[12]+"+0"){
       m.setDot(4,1,false);
      } 
       if(outMsg == deneme[13]+"+1"){
    m.setDot(5,1,true);
    }else if(outMsg == deneme[13]+"+0"){
       m.setDot(5,1,false);
      } 
       if(outMsg == deneme[14]+"+1"){
    m.setDot(6,1,true);
    }else if(outMsg == deneme[14]+"+0"){
       m.setDot(6,1,false);
      } 
       if(outMsg == deneme[15]+"+1"){
    m.setDot(7,1,true);
    }else if(outMsg == deneme[15]+"+0"){
       m.setDot(7,1,false);
      } 
      
      




       if(outMsg == deneme[16]+"+1"){
    m.setDot(0,2,true);
    }else if(outMsg == deneme[16]+"+0"){
       m.setDot(0,2,false);
      } 
       if(outMsg == deneme[17]+"+1"){
    m.setDot(1,2,true);
    }else if(outMsg == deneme[17]+"+0"){
       m.setDot(1,2,false);
      } 
       if(outMsg == deneme[18]+"+1"){
    m.setDot(2,2,true);
    }else if(outMsg == deneme[18]+"+0"){
       m.setDot(2,2,false);
      } 
       if(outMsg == deneme[19]+"+1"){
    m.setDot(3,2,true);
    }else if(outMsg == deneme[19]+"+0"){
       m.setDot(3,2,false);
      } 
       if(outMsg == deneme[20]+"+1"){
    m.setDot(4,2,true);
    }else if(outMsg == deneme[20]+"+0"){
       m.setDot(4,2,false);
      } 
       if(outMsg == deneme[21]+"+1"){
    m.setDot(5,2,true);
    }else if(outMsg == deneme[21]+"+0"){
       m.setDot(5,2,false);
      } 
       if(outMsg == deneme[22]+"+1"){
    m.setDot(6,2,true);
    }else if(outMsg == deneme[22]+"+0"){
       m.setDot(6,2,false);
      } 
      
                 if(outMsg == deneme[23]+"+1"){
    m.setDot(7,2,true);
    }else if(outMsg == deneme[23]+"+0"){
       m.setDot(7,2,false);
      } 









   
       if(outMsg == deneme[24]+"+1"){
    m.setDot(0,3,true);
    }else if(outMsg == deneme[24]+"+0"){
       m.setDot(0,3,false);
      } 
       if(outMsg == deneme[25]+"+1"){
    m.setDot(1,3,true);
    }else if(outMsg == deneme[25]+"+0"){
       m.setDot(1,3,false);
      } 
       if(outMsg == deneme[26]+"+1"){
    m.setDot(2,3,true);
    }else if(outMsg == deneme[26]+"+0"){
       m.setDot(2,3,false);
      } 
       if(outMsg == deneme[27]+"+1"){
    m.setDot(3,3,true);
    }else if(outMsg == deneme[27]+"+0"){
       m.setDot(3,3,false);
      } 
       if(outMsg == deneme[28]+"+1"){
    m.setDot(4,3,true);
    }else if(outMsg == deneme[28]+"+0"){
       m.setDot(4,3,false);
      } 
       if(outMsg == deneme[29]+"+1"){
    m.setDot(5,3,true);
    }else if(outMsg == deneme[29]+"+0"){
       m.setDot(5,3,false);
      } 
       if(outMsg == deneme[30]+"+1"){
    m.setDot(6,3,true);
    }else if(outMsg == deneme[30]+"+0"){
       m.setDot(6,3,false);
      } 
      
                 if(outMsg == deneme[31]+"+1"){
    m.setDot(7,3,true);
    }else if(outMsg == deneme[31]+"+0"){
       m.setDot(7,3,false);
      }    



               if(outMsg == deneme[32]+"+1"){
    m.setDot(0,4,true);
    }else if(outMsg == deneme[32]+"+0"){
       m.setDot(0,4,false);
      }   
               if(outMsg == deneme[33]+"+1"){
    m.setDot(1,4,true);
    }else if(outMsg == deneme[33]+"+0"){
       m.setDot(1,4,false);
      }   
               if(outMsg == deneme[34]+"+1"){
    m.setDot(2,4,true);
    }else if(outMsg == deneme[34]+"+0"){
       m.setDot(2,4,false);
      }   
               if(outMsg == deneme[35]+"+1"){
    m.setDot(3,4,true);
    }else if(outMsg == deneme[35]+"+0"){
       m.setDot(3,4,false);
      }   
               if(outMsg == deneme[36]+"+1"){
    m.setDot(4,4,true);
    }else if(outMsg == deneme[36]+"+0"){
       m.setDot(4,4,false);
      }   
               if(outMsg == deneme[37]+"+1"){
    m.setDot(5,4,true);
    }else if(outMsg == deneme[37]+"+0"){
       m.setDot(5,4,false);
      }   
               if(outMsg == deneme[38]+"+1"){
    m.setDot(6,4,true);
    }else if(outMsg == deneme[38]+"+0"){
       m.setDot(6,4,false);
      }   
               if(outMsg == deneme[39]+"+1"){
    m.setDot(7,4,true);
    }else if(outMsg == deneme[39]+"+0"){
       m.setDot(7,4,false);
      }   




    if(outMsg == deneme[40]+"+1"){
    m.setDot(0,5,true);
    }else if(outMsg == deneme[40]+"+0"){
       m.setDot(0,5,false);
      }   
               if(outMsg == deneme[41]+"+1"){
    m.setDot(1,5,true);
    }else if(outMsg == deneme[41]+"+0"){
       m.setDot(1,5,false);
      }   
               if(outMsg == deneme[42]+"+1"){
    m.setDot(2,5,true);
    }else if(outMsg == deneme[42]+"+0"){
       m.setDot(2,5,false);
      }   
               if(outMsg == deneme[43]+"+1"){
    m.setDot(3,5,true);
    }else if(outMsg == deneme[43]+"+0"){
       m.setDot(3,5,false);
      }   
               if(outMsg == deneme[44]+"+1"){
    m.setDot(4,5,true);
    }else if(outMsg == deneme[44]+"+0"){
       m.setDot(4,5,false);
      }   
               if(outMsg == deneme[45]+"+1"){
    m.setDot(5,5,true);
    }else if(outMsg == deneme[45]+"+0"){
       m.setDot(5,5,false);
      }   
               if(outMsg == deneme[46]+"+1"){
    m.setDot(6,5,true);
    }else if(outMsg == deneme[46]+"+0"){
       m.setDot(6,5,false);
      }   
               if(outMsg == deneme[47]+"+1"){
    m.setDot(7,5,true);
    }else if(outMsg == deneme[47]+"+0"){
       m.setDot(7,5,false);
      }   





  if(outMsg == deneme[48]+"+1"){
    m.setDot(0,6,true);
    }else if(outMsg == deneme[48]+"+0"){
       m.setDot(0,6,false);
      }   
               if(outMsg == deneme[49]+"+1"){
    m.setDot(1,6,true);
    }else if(outMsg == deneme[49]+"+0"){
       m.setDot(1,6,false);
      }   
               if(outMsg == deneme[50]+"+1"){
    m.setDot(2,6,true);
    }else if(outMsg == deneme[50]+"+0"){
       m.setDot(2,6,false);
      }   
               if(outMsg == deneme[51]+"+1"){
    m.setDot(3,6,true);
    }else if(outMsg == deneme[51]+"+0"){
       m.setDot(3,6,false);
      }   
               if(outMsg == deneme[52]+"+1"){
    m.setDot(4,6,true);
    }else if(outMsg == deneme[52]+"+0"){
       m.setDot(4,6,false);
      }   
               if(outMsg == deneme[53]+"+1"){
    m.setDot(5,6,true);
    }else if(outMsg == deneme[53]+"+0"){
       m.setDot(5,6,false);
      }   
               if(outMsg == deneme[54]+"+1"){
    m.setDot(6,6,true);
    }else if(outMsg == deneme[54]+"+0"){
       m.setDot(6,6,false);
      }   
               if(outMsg == deneme[55]+"+1"){
    m.setDot(7,6,true);
    }else if(outMsg == deneme[55]+"+0"){
       m.setDot(7,6,false);
      }  


 if(outMsg == deneme[56]+"+1"){
    m.setDot(0,7,true);
    }else if(outMsg == deneme[56]+"+0"){
       m.setDot(0,7,false);
      }   
               if(outMsg == deneme[57]+"+1"){
    m.setDot(1,7,true);
    }else if(outMsg == deneme[57]+"+0"){
       m.setDot(1,7,false);
      }   
               if(outMsg == deneme[58]+"+1"){
    m.setDot(2,7,true);
    }else if(outMsg == deneme[58]+"+0"){
       m.setDot(2,7,false);
      }   
               if(outMsg == deneme[59]+"+1"){
    m.setDot(3,7,true);
    }else if(outMsg == deneme[59]+"+0"){
       m.setDot(3,7,false);
      }   
               if(outMsg == deneme[60]+"+1"){
    m.setDot(4,7,true);
    }else if(outMsg == deneme[60]+"+0"){
       m.setDot(4,7,false);
      }   
               if(outMsg == deneme[61]+"+1"){
    m.setDot(5,7,true);
    }else if(outMsg == deneme[61]+"+0"){
       m.setDot(5,7,false);
      }   
               if(outMsg == deneme[62]+"+1"){
    m.setDot(6,7,true);
    }else if(outMsg == deneme[62]+"+0"){
       m.setDot(6,7,false);
      }   
               if(outMsg == deneme[63]+"+1"){
    m.setDot(7,7,true);
    }else if(outMsg == deneme[63]+"+0"){
       m.setDot(7,7,false);
      }  
      


           if(outMsg == "c"){
    m.writeSprite(0,0,A);
    }

            if(outMsg == "d"){
    m.writeSprite(0,0,B);
    }
              if(outMsg == "e"){
    m.writeSprite(0,0,C);
    }
              if(outMsg == "f"){
    m.writeSprite(0,0,D);
    }
              if(outMsg == "g"){
    m.writeSprite(0,0,F);
    }
              if(outMsg == "h"){
    m.writeSprite(0,0,G);
   
    }
                 if(outMsg == "j"){
    m.clear();
     Serial1.write("DENEMEEEEEEEEEEEEEEEEEE");
    }
   
   
   
   
   
   
   
   
   
   }}
