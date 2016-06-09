/*
  Analog Input
 Demonstrates analog input by reading an analog sensor on analog pin 0 and
 turning on and off a light emitting diode(LED)  connected to digital pin 13. 
 The amount of time the LED will be on and off depends on
 the value obtained by analogRead(). 
 
 The circuit:
 * Potentiometer attached to analog input 0
 * center pin of the potentiometer to the analog pin
 * one side pin (either one) to ground
 * the other side pin to +5V
 * LED anode (long leg) attached to digital output 13
 * LED cathode (short leg) attached to ground
 
 * Note: because most Arduinos have a built-in LED attached 
 to pin 13 on the board, the LED is optional.
 
 
 Created by David Cuartielles
 modified 30 Aug 2011
 By Tom Igoe
 
 This example code is in the public domain.
 
 http://arduino.cc/en/Tutorial/AnalogInput
 
 */

int SensorPin = 6;    // select the input pin for the potentiometer
int led = 13;      // select the pin for the LED
int SensorValue = 0;  // variable to store the value coming from the sensor
int mosfet = 3;
int Shaking = 0;
int NoShaking = 0;
boolean Heat = false;
int Time = 0;
int MaxTime = 1000;


void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(led, OUTPUT);  
  pinMode(mosfet, OUTPUT); 
  Serial.begin(9600);
}

void loop() {

  SensorValue = digitalRead(SensorPin); 
  Serial.println(SensorValue);
  Serial.print(NoShaking);
  Serial.print(Heat);
  Serial.print(Time);
  
  if(SensorValue == 0) {
    NoShaking = 0;
    Shaking = Shaking + 1;
  }
  
  if(SensorValue == 1) {
    NoShaking = NoShaking +1;
  }
  
  if(NoShaking > 10) {
    Shaking = 0;
    NoShaking = 0;
  }
  
  if(Shaking > 10){
    Heat = true;
  }
  
  if(Heat == true){
    digitalWrite(mosfet, HIGH);
    digitalWrite(led, HIGH);  
    Time = Time + 1;
  }
  
  if(Time > MaxTime){
    digitalWrite(mosfet, LOW); 
   digitalWrite(led, LOW);   
    Time = 0;
    Heat = false;
  }
  
 // if (sensorValue < 100) {
 // analogWrite(mosfet, 255); 
 delay(100);
}
