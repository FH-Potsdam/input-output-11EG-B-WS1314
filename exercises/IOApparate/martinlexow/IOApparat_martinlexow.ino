
#include <Servo.h> 

Servo servoLinks;
Servo servoRechts;
int posServoLinks=0;
int posServoRechts=0;

boolean initalized=false;
int pinTemp=0; //analog
float temperatur=0;
float tempRec[10];
int tempRecIndex=0;
int tempRecCount=(sizeof(tempRec)/sizeof(float));
float tempAverage=0;
int pos=0;


void setup(){
  servoLinks.attach(2);
  servoRechts.attach(3);
  Serial.begin(9600);
  
  //servoTest();
  
    //servoOben();
    //delay(500);
    servoUnten();
    delay(4000);
     
     servoOben();
 
  delay(5000);
  
  //servoWinken(); // beidohrig winken
  
  //delay(3000);
  
  //servoWinkenRechts(); // winken rechts
  //delay(3000);
  //servoWinkenLinks(); // winken links
  //delay(3000);
  //servoRechtsHoch(); // rechtes ohr hoch halten
  //delay(3000);
  //servoLinksHoch(); // linkes ohr hoch halten
  //delay(3000);

}



void getTempAverage(){
    tempAverage=0;
    for(int i=0;i<tempRecCount; i=i+1){tempAverage = tempAverage + tempRec[i];}
    tempAverage = tempAverage/tempRecCount;
    Serial.println(tempAverage);
    
        //if(tempAverage<=24){
          //servoUnten();
          //}else{
          //delay(500);
          //servoOben();
        //}
}


void servoStatus(){
  int servoLstatus = servoLinks.read();
  int servoRstatus = servoRechts.read();
  Serial.print("servoLinks: ");Serial.println(servoLstatus);
  Serial.print("servoRechts: ");Serial.println(servoRstatus);
}


void servoUnten(){
    //neutral (beide unten)
    servoLinks.write(0);
    servoRechts.write(180);
    }

    
void servoOben(){
    //neutral (beide unten)
    servoLinks.write(115);
    servoRechts.write(65);
    }

void servoWinkenRechts(){
    //rechts oben, links unten
    servoLinks.write(115);
    servoRechts.write(180);
    delay(500);
    servoLinks.write(0);
    servoRechts.write(180);
    delay(500);
    servoLinks.write(115);
    servoRechts.write(180);
    delay(500);
    servoLinks.write(0);
    servoRechts.write(180);
    delay(500);
}

void servoRechtsHoch(){
    servoLinks.write(115);
    servoRechts.write(180);
}

void servoLinksHoch(){
    servoLinks.write(0);
    servoRechts.write(65);
}

void servoWinkenLinks(){
    //links oben, rechts unten
    servoLinks.write(0);
    servoRechts.write(65);
    delay(500);
    servoLinks.write(0);
    servoRechts.write(180);
    delay(500);
    servoLinks.write(0);
    servoRechts.write(65);
    delay(500);
    servoLinks.write(0);
    servoRechts.write(180);
    delay(500);
}
    
void servoWinken(){
    servoUnten();
    delay(500);
    servoOben();
    delay(500);
    servoUnten();
    delay(500);
    servoOben();
    delay(500);
    servoUnten();
    delay(500);
}


void servoTest(){

    //neutral (beide unten)
    servoLinks.write(0);
    servoRechts.write(180);
    
    delay(2000);
    
    //maximal oben
    servoLinks.write(115);
    servoRechts.write(65);
    
    delay(500);
    
    //neutral
    servoLinks.write(0);
    servoRechts.write(180);
    
    delay(500);
    
    //links oben, rechts unten
    servoLinks.write(115);
    servoRechts.write(180);
    
    delay(500);
    
    //links unten, rechts oben
    servoLinks.write(0);
    servoRechts.write(65);
    
    delay(500);
    
    //neutral (beide unten)
    servoLinks.write(0);
    servoRechts.write(180);
    
    delay(500);
    
    //maximal oben
    servoLinks.write(115);
    servoRechts.write(65);
    
    delay(500);
    
    //neutral (beide unten)
    servoLinks.write(0);
    servoRechts.write(180);

}

void servoUp(){
  servoLinks.write(180);
  servoRechts.write(0);
}


void servoDown(){
  servoLinks.write(0);
  servoRechts.write(180);
}


void loop(){
  delay(1000);
  temperatur = (((int(analogRead(pinTemp))*5.0)/1024.0)-0.5)*100;
  if(tempRecIndex<tempRecCount){
      tempRec[tempRecIndex] = temperatur;
      //Serial.print(tempRecIndex);Serial.print(" - ");Serial.println(tempRec[tempRecIndex]);
      tempRecIndex = tempRecIndex + 1;
      
    }else{
      tempRecIndex=0;
      if(initalized==false){initalized=true;Serial.println("initalized");}
    }
  //getTempAverage();
  //Serial.println(temperatur);
  getTempAverage();
}

    
  

