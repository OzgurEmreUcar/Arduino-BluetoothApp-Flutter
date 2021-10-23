int buzzerPin = 12;
int notaSayisi = 8;
int kdo = 262;
int re = 294;
int mi = 330;
int fa = 349;
int sol = 392;
int la = 440;
int si = 494;
int ido = 523;
int cmd = -1;
int flag = 0;
int ledPin = 13;

void setup() {
    Serial1.begin(9600);
    pinMode(13,OUTPUT);

}

void loop() {
  if(Serial1.available()>0){
    cmd = Serial1.read();
    flag = 1;
    }
   if(flag == 1){
   if(cmd == '2'){
    tone(buzzerPin,kdo);
    }
    else if(cmd == '3'){
      tone(buzzerPin,re);
      }
       else if(cmd == '4'){
      tone(buzzerPin,mi);
      }
        else if(cmd == '5'){
      tone(buzzerPin,fa);
      }
        else if(cmd == '6'){
      tone(buzzerPin,sol);
      }
        else if(cmd == '7'){
      tone(buzzerPin,la);
      }
        else if(cmd == '8'){
      tone(buzzerPin,si);
      } else if(cmd == '9'){
      tone(buzzerPin,ido);
      }else if(cmd == '1'){
       noTone(buzzerPin);
      }else if(cmd == 'a'){
        digitalWrite(ledPin,HIGH);
        }else if(cmd == 'k'){
          digitalWrite(ledPin,LOW);
          }




















    
    } else{
      Serial1.print("unknown command: ");
      Serial1.write(cmd);
      Serial1.print(" (");
      Serial1.print(cmd, DEC);
      Serial1.print(")");

      Serial1.println();
      }
flag = 0;    
cmd = 65;
}
