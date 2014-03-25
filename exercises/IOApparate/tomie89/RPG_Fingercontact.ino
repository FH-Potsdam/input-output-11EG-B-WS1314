/*
  Nachtlicht
  blendet Farben durch
  
  Dieses Beispiel aus dem Fritzing Creator Kit: www.fritzing.org/creator-kit.
*/

int LEDGreen=13;                                      // LEDGreen Pins wird deklariert
int LEDBlue=12;                                      // LEDBlue Pins wird deklariert
int LEDRed=11;                                      // LEDRed Pins wird deklariert 
int Finger1=2;
int Finger2=3;
int Finger3=4;
int Finger4=5;

void setup(){
  Serial.begin(9600);
  pinMode(Finger1, INPUT);
  pinMode(Finger2, INPUT);
  pinMode(Finger3, INPUT);
  pinMode(Finger4, INPUT);
  pinMode(LEDRed,OUTPUT);                            // Pin wird als OUTPUT initialisiert
  pinMode(LEDGreen,OUTPUT);                          // Pin wird als OUTPUT initialisiert
  pinMode(LEDBlue,OUTPUT);                           // Pin wird als OUTPUT initialisiert
}

void loop(){
  
  Serial.println(digitalRead(Finger1));
  if (digitalRead(Finger1)){
  digitalWrite(LEDRed, HIGH);
  }else{
  digitalWrite(LEDRed, LOW);
  }
  
  Serial.println(digitalRead(Finger2));
  if (digitalRead(Finger2)){
  digitalWrite(LEDGreen, HIGH);
  }else{
  digitalWrite(LEDGreen, LOW);
  }
  
  Serial.println(digitalRead(Finger3));
  if (digitalRead(Finger3)){
  digitalWrite(LEDBlue, HIGH);
  }else{
  digitalWrite(LEDBlue, LOW);
  
  Serial.println(digitalRead(Finger4));
  if (digitalRead(Finger4)){
  digitalWrite(LEDRed, HIGH);
  digitalWrite(LEDGreen, HIGH);
  digitalWrite(LEDBlue, HIGH);
  }else{
  digitalWrite(LEDRed, LOW);
  digitalWrite(LEDGreen, LOW);
  digitalWrite(LEDBlue, LOW);
}
  }
}
