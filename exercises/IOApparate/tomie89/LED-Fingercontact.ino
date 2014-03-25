//Pin connected to ST_CP of 74HC595
int latchPin = 8;
//Pin connected to SH_CP of 74HC595
int clockPin = 12;
////Pin connected to DS of 74HC595
int dataPin = 11;

/**
 * This is an array of all the pins connected to the fingers/buttons
 * we use an array for easier handling
 */
int fingerpins  [8] = {2,3,4,5, 6,7,9,10};

/**
 * This is the byte that gets set by the fingers
 * and gets send to the shiftregister
 * we set the byte by using bitSet and bitClear see
 * bitset = http://arduino.cc/de/Reference/BitSet
 * bitclear = http://arduino.cc/de/Reference/BitClear
 *
 */
byte data = B00000000;


void setup(){
  
   Serial.begin(9600); // just for seeing whats going on

/**
 * Set up the shiftregister
 */
  pinMode(latchPin, OUTPUT);
  pinMode(dataPin, OUTPUT);  
  pinMode(clockPin, OUTPUT);
  
  /*
  * initilize all input pins for the fingers in a loop
  */
  for(int  i = 0; i < 8;i++ ){
    pinMode(fingerpins[i],INPUT);
  } // end of i loop
  
} // end of setup



void loop(){
  /**
   * Now we loop over all fingers/buttons and see if they are 
   * HIGH or LOW
   * if they are HIGH they send 1
   * if they are low they send 0
   * we use this to set the accornding bit in the byte we send 
   */
  for(int i = 0; i < 8; i++){
    if(digitalRead(fingerpins[i])==1){
      // we have a connection set the according bit in the data byte to 1
      bitSet(data,i);
    }else{
      // no connection found set the according bit in the byte data to 0
      bitClear(data,i);
    }
    
  }
  delay(10);// just to not be to fast
  /**
   * set the LEDS with the data byte and the shiftregister
   *
   */
  setLEDs(data);


}

/**
 * this sets the LEDs
 */
void setLEDs(byte val){
   digitalWrite(latchPin, LOW);
   shiftOut(dataPin, clockPin, LSBFIRST, val);
   digitalWrite(latchPin, HIGH);
}

