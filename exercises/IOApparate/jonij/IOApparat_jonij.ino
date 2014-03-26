#define SHIFTPWM_NOSPI
const int ShiftPWM_latchPin=A0;
const int ShiftPWM_dataPin = A2;
const int ShiftPWM_clockPin = A1;
const int capsendPin = 13;
const bool ShiftPWM_invertOutputs = false; 
const bool ShiftPWM_balanceLoad = true;
int buttonstat[8][2] = {{0,1},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}};
int buttonval[8] = {0,0,0,0,0,0,0,0};
int ledstats[3] = {0,255,0};
int ledcolor[2] = {0,100};
#include <ShiftPWM.h>   // include ShiftPWM.h after setting the pins!
#include <CapacitiveSensor.h>
const int sensivity =30;
long previousMillis = 0;
long interval = 100;
int BLINK = 0;
CapacitiveSensor   touch[8] = {CapacitiveSensor(capsendPin,2),CapacitiveSensor(capsendPin,3),CapacitiveSensor(capsendPin,4),CapacitiveSensor(capsendPin,5),CapacitiveSensor(capsendPin,6),CapacitiveSensor(capsendPin,7),CapacitiveSensor(capsendPin,8),CapacitiveSensor(capsendPin,9)};
int buttoncal[8] = {0,0,0,0,0,0,0,0};;
int cal[8] = {0,0,0,0,0,0,0,0};
int counter[8] = {0,0,0,0,0,0,0,0};

void setup(){
  Serial.begin(9600);
  ShiftPWM.SetAmountOfRegisters(3);
  ShiftPWM.Start(75,100);
}

void loop()
{    
  unsigned long currentMillis = millis();
 
  if(currentMillis - previousMillis > interval) {
    previousMillis = currentMillis;   
    if (BLINK == 0)
      BLINK = 100;
    else
      BLINK = 0;
  }

  
  
  for (int i=0; i<8; i++){

    Serial.print(touch[i].capacitiveSensor(sensivity));
    Serial.print("\t");


    if (cal[i] == 0){
    for(int j=0; j<50; j++){
    	buttoncal[i] = buttoncal[i] + touch[0].capacitiveSensor(sensivity);
    }
        cal[i] = 1;
    	buttoncal[i] = buttoncal[i]/50;
}    
    
if(touch[i].capacitiveSensor(sensivity)>100){
      
        
      counter[i] = counter[i]+1;
      if(counter[i] == 50) {
              if (buttonstat[i][1] == 2)
                buttonstat[i][1] = 0;
              else
                buttonstat[i][1] = buttonstat[0][1]+1;
      }
      if(counter[i] == 500) {
              if (buttonstat[i][0] == 0) {
                buttonstat[i][0] = 1;
              } else {
                buttonstat[i][0] = 0;}
      }
    } else  { counter[i] = 0;}

   ShiftPWM.SetHSV(i,ledcolor[buttonstat[i][0]],255,ledstats[buttonstat[i][1]]);   
}
    Serial.println();
}
