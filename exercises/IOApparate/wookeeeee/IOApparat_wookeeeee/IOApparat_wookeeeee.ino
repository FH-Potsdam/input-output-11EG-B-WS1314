#include <CapacitiveSensor.h>
#include "LedControlMS.h"


CapacitiveSensor   cs_4_2 = CapacitiveSensor(2,3);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired
CapacitiveSensor   cs_4_6 = CapacitiveSensor(7,6);        // 10M resistor between pins 4 & 6, pin 6 is sensor pin, add a wire and or foil

#define NBR_MTX 2

LedControl lc = LedControl(12, 11, 10, NBR_MTX);

byte leftArrow[8][8]  = {
  { 
    0,0,0,1,1,0,0,0      }
  ,
  { 
    0,0,1,1,0,0,0,0      }
  ,
  { 
    0,1,1,0,0,0,0,0      }
  ,
  { 
    1,1,0,0,0,0,0,0      }
  ,
  { 
    1,1,0,0,0,0,0,0      }
  ,
  { 
    0,1,1,0,0,0,0,0      }
  ,
  { 
    0,0,1,1,0,0,0,0      }
  ,
  { 
    0,0,0,1,1,0,0,0      }
};

byte rightArrow[8][8]  = {
  {
    0,0,0,1,1,0,0,0      }
  ,
  { 
    0,0,0,0,1,1,0,0      }
  ,
  { 
    0,0,0,0,0,1,1,0      }
  ,
  { 
    0,0,0,0,0,0,1,1      }
  ,
  { 
    0,0,0,0,0,0,1,1      }
  ,
  { 
    0,0,0,0,0,1,1,0      }
  ,
  { 
    0,0,0,0,1,1,0,0      }
  ,
  { 
    0,0,0,1,1,0,0,0      }
};



String digits;
int digitCounter = 0;
void drawArrow();
void setup(){

  Serial.begin(9600);
  Serial.println("Setup");
  digitCounter = 0;
  for(int i = 0; i<NBR_MTX; i++){
    lc.shutdown(i, false);
    lc.setIntensity(i, 8);
    lc.clearDisplay(i);
  }

  char ch = digits[digitCounter];
  Serial.println(ch);
  digitCounter++;
  if(digitCounter>3) digitCounter = 0;
  lc.displayChar(0, lc.getCharArrayPosition(ch));
  delay(300);
  lc.clearAll();
  delay(300);

  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
}

int leftStartX = 0;
int rightStartX = 7;
bool draw = false;
bool drawLeft = false;
bool drawRight = false;
void loop(){

  long start = millis();
  long total1 =  cs_4_2.capacitiveSensor(30);
  long total2 =  cs_4_6.capacitiveSensor(30);
  Serial.print(total1);                  // print sensor output 1
  Serial.print("\t");
  Serial.print(total2);                  // print sensor output 2
  Serial.println("");
  
  if (total1 > 80) {
    drawLeft = true;
  } else {
    drawLeft = false;
  }
  
  if (total2 > 80) {
    drawRight = true;
  } else {
    drawRight = false;
  }
  
  if (draw) {
    drawArrow();
  }
  draw = !draw;
  delay(50);
}

void drawArrow()
{
  if (drawLeft && drawRight) {
    for (int loopY = 7; loopY >= 0; loopY--)
    {
      int tmpStartX = rightStartX;
      for (int loopX = 7; loopX >= 0; loopX--)
      {
        lc.setLed(0,loopX,loopY,(leftStartX % 2) ? true : false);
        tmpStartX--;
        if (tmpStartX < 2) {
          tmpStartX = 7;
        }
      }
    }
  } else if (drawLeft) {
    for (int loopY = 0; loopY < 8; loopY++)
    {
      int tmpStartX = leftStartX;
      for (int loopX = 0; loopX < 8; loopX++)
      {
        lc.setLed(0,loopX,loopY,leftArrow[loopY][tmpStartX]);
        tmpStartX++;
        if (tmpStartX >= 6) {
          tmpStartX = 0;
        }
      }
    }
  } 
  else if (drawRight) {
    for (int loopY = 7; loopY >= 0; loopY--)
    {
      int tmpStartX = rightStartX;
      for (int loopX = 7; loopX >= 0; loopX--)
      {
        lc.setLed(0,loopX,loopY,rightArrow[loopY][tmpStartX]);
        tmpStartX--;
        if (tmpStartX < 2) {
          tmpStartX = 7;
        }
      }
    }
  } else
  {
    for (int loopY = 0; loopY < 8; loopY++)
    {
      for (int loopX = 0; loopX < 8; loopX++)
      {
        lc.setLed(0,loopX,loopY,true);
      }
    }
  }
  leftStartX++;
  if (leftStartX >= 6) {
    leftStartX = 0;
  }

  rightStartX--;
  if (rightStartX < 2) {
    rightStartX = 7;
  }
}



