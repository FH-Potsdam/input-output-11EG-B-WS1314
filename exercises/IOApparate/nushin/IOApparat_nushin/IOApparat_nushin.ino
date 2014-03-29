int audiopin = A0;
int ledpin = 9;
int refpin = 8;
void setup(){
pinMode(ledpin,OUTPUT);
pinMode(refpin,OUTPUT);
Serial.begin(9600);
}

void loop(){
  int audiovalue = analogRead(audiopin);
  if(audiovalue > 1000){
    digitalWrite(refpin,HIGH);
    record();
    digitalWrite(refpin,LOW);
  }
}

void record(){
  digitalWrite(ledpin,HIGH);
    delay(100);
  digitalWrite(ledpin,LOW);

  Serial.println("Turned Recording on");
  
   unsigned long time = millis()+5000;
//    digitalWrite(LED, HIGH);
    while(millis() < time){
//  for(int i = 0;i < 1000;i++){
  Serial.println("Recording");
  }
  digitalWrite(ledpin,HIGH);
    delay(100);

  digitalWrite(ledpin,LOW);

  Serial.println("Turned Recording off");
}
