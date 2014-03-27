// see https://gist.github.com/positron96/7269466
#define ANALOG_IN 0

int led = 13;
int led2 = 11;
int led3 = 10;
int motor_A=9;
int motor_Speed=3;
int monster = 0;

 
void setup() {
  pinMode(led3, OUTPUT);
  pinMode(led, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(motor_A,OUTPUT);
  Serial.begin(9600); 
}
 
void loop() {
  int val = analogRead(ANALOG_IN);
  // ??? some wired bitshifting stuff
  Serial.println(val);
  Serial.write( 0xff );                                                         
  Serial.write( (val >> 8) & 0xff );                                            
  Serial.write( val & 0xff );
  Serial.write("\n");
  Serial.write(monster);
  
 
  
  
  if (monster>60){         // wenn sound lauter als 200
    digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
     digitalWrite(led, HIGH);     // LED einschalten
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    digitalWrite(led, LOW);     // LED einschalten
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW); 
    digitalWrite(motor_A,HIGH);  // Motor an
    delay(500);                  // Delay für Motor
    monster=0;
    
     
  } else              // Standby
    digitalWrite(led, LOW);
    digitalWrite(motor_A,LOW); // Motor aus
    
    
    if (val > 800){         // wenn sound lauter als 200
    monster++;
    
     
  } else              // Standby
    digitalWrite(led, LOW);
    digitalWrite(motor_A,LOW); // Motor aus
  
  
     
}
//Arduino Poor man's oscilloscope
