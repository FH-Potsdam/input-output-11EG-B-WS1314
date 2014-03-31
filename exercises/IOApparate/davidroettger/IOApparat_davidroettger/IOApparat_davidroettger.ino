#include <Servo.h> 

// these constants won't change: 
Servo derservo;
int pos = 0;
const int ledPin = 7;      // led connected to digital pin 13
const int knockSensor = A0; // the piezo is connected to analog pin 0
const int threshold = 100;
int speakerPin = 12;
int numTones = 10;
int tones[] = {69, 73, 69, 311, 121, 261, 73, 69, 540, 121,};


// threshold value to decide when the detected sound is a knock or not


// these variables will change:
int sensorReading = 0;      // variable to store the value read from the sensor pin
int ledState = LOW;         // variable used to store the last LED status, to toggle the light
boolean trigger = false;
int knockcounter; 
boolean started = false;

long previousMillis = 0;
long interval = 3000;  

void setup() {
  pinMode(ledPin, OUTPUT); // declare the ledPin as as OUTPUT
  derservo.attach(9);
  Serial.begin(9600);       // use the serial port
}

void loop() {
  // read the sensor and store it in the variable sensorReading:
  
  unsigned long currentMillis = millis();
  
  
  sensorReading = analogRead(knockSensor);    

  // if the sensor reading is greater than the threshold:
  if (sensorReading >= threshold ) {       
    // send the string "Knock!" back to the computer, followed by newline
    Serial.println("Knock!"); 
    digitalWrite(ledPin, HIGH);
    Serial.println(knockcounter); 
    ++knockcounter;
    
    if (started == false) {
    trigger = true;
    started = true; }
    
    else {
      trigger = false;
    }
    
  }
  
  if(pos<180 && trigger){
    pos+=10;
//    digitalWrite(ledPin, HIGH);
  }
  
  else{
    pos=0;
    trigger=false;
  }
  
   if (knockcounter > 2) {
    digitalWrite(ledPin, HIGH);
  }
  
     if (knockcounter > 5) {
    digitalWrite(ledPin, LOW);
  }
  
     if (knockcounter > 10) {
    digitalWrite(ledPin, LOW);
    started=false; 
  }
  
    if (knockcounter > 13) {
  
  for (int i = 0; i < numTones; i++)
  {
    tone(speakerPin, tones[i]);
    delay(500);
  }
  noTone(speakerPin);
  
    }
  
 
  if(currentMillis - previousMillis > interval) {
  previousMillis = currentMillis; 
  knockcounter = 0 ;    
  
 }
 
   
   derservo.write(pos);
  
  delay(100);  // delay to avoid overloading the serial port buffer
}

