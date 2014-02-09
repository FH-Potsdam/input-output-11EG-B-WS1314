/**
 * Sketch supporting the Mimose Project by Jens Rauenbusch, FH Potsdam, 2014
 * See »README.md« for project and course details
 *
 * This sketch uses the push button to activate muscle wire. The demo video
 * shows a tilt switch, which is not implemented in this sketch.
 *
 * Based on the »push button« sketch by Fabian Moron Zirfas, 2014
 *
 */
int ledpin = 13; // for output indication
int pushpin = 2; // pushbutton input
int is_on = 0;// boolean

void setup(){
pinMode(ledpin, OUTPUT); // init
pinMode(pushpin, INPUT); // inti
  
}
void loop(){
  is_on = digitalRead(pushpin); // read from the button

  if(is_on){
  digitalWrite(ledpin,HIGH); // on
  }else{
    digitalWrite(ledpin,LOW); // off
  }
}
