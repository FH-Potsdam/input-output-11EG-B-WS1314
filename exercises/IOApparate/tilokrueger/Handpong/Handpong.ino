#include <CapacitiveSensor.h>



int total1;
int total2;
int schaltgrenze = 1000;

CapacitiveSensor   cs_4_2 = CapacitiveSensor(4,2);        // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor   cs_4_8 = CapacitiveSensor(4,8);        // 10 megohm resistor between pins 4 & 8, pin 8 is sensor pin, add wire, foil



void setup(){
 Serial.begin(9600);
 pinMode(8, INPUT);
 pinMode(2, INPUT);
 
 
 pinMode(5, OUTPUT);
 pinMode(10, OUTPUT);
 
 
 }


void loop(){
    long total1 =  cs_4_2.capacitiveSensor(30);
    long total3 =  cs_4_8.capacitiveSensor(30);

     Serial.print("\n");                    // tab character for debug window spacing
     Serial.print(total1);                  // print sensor output 1

     Serial.print("\t");
     Serial.println(total3);                // print sensor output 3
   
     delay(200);                             // arbitrary delay to limit data to serial port 

if (total1<schaltgrenze){
  digitalWrite(5, LOW);
}
if (total1>=schaltgrenze){
  digitalWrite(5, HIGH);
}

if (total3<schaltgrenze){
  digitalWrite(10, LOW);
}
if (total3>=schaltgrenze){
  digitalWrite(10, HIGH);
}


}
//
//else {
//  digitalWrite(4, LOW);
//  







//delay(100);

  
