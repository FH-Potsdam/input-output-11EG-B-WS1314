int sensorValue;

// RGB Led Setup
const int redPin = 5;
const int greenPin = 10;
const int bluePin = 9;

void setup(){
  pinMode(redPin,   OUTPUT);
  pinMode(greenPin, OUTPUT);   
  pinMode(bluePin,  OUTPUT); 
}


void loop(){
  
  sensorValue = analogRead(5);      
  Serial.println(sensorValue, DEC);  
 // delay(10);                      
  
  if(sensorValue >= 110){
    for(int redVal = 1; redVal <= 255; redVal = redVal+3) { 
      analogWrite(redPin, redVal);    
      delay(5);                                                         
    } 
  
    for(int redVal = 255; redVal >= 1; redVal = redVal-3) {    
      analogWrite(redPin, redVal); 
      delay(5);                                                         
    } 
  }

  if(sensorValue >= 100 && sensorValue <= 109){
    for(int orangeVal = 10; orangeVal <= 245; orangeVal = orangeVal+2) { 
      analogWrite(redPin, orangeVal); 
      analogWrite(greenPin, 40);
      delay(10);                                                         
    } 
  
    for(int orangeVal = 245; orangeVal >= 10; orangeVal = orangeVal-2) {    
      analogWrite(redPin, orangeVal);
      analogWrite(greenPin, 20);
      delay(10);                                                         
    } 
  }
  
  if(sensorValue >= 90 && sensorValue <= 99){
    for(int greenVal = 5; greenVal <= 255; greenVal = greenVal+1) { 
      analogWrite(greenPin, greenVal);    
      delay(10);                                                         
    } 
  
    for(int greenVal = 255; greenVal >= 5; greenVal = greenVal-1) {    
      analogWrite(greenPin, greenVal); 
      delay(10);                                                         
    }  
  }
  
  if(sensorValue < 89){
    setColor(0, 0, 255);
  }
}


void setColor(int red, int green, int blue) {
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);
}

void setColorTag1(int redVal1, int greenVal1, int blueVal1) {
  analogWrite(redPin, redVal1);
  analogWrite(greenPin, greenVal1);
  analogWrite(bluePin, blueVal1); 
}
