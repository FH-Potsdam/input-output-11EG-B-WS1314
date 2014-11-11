import java.util.*;
import java.text.*;
import processing.serial.*;
import cc.arduino.*;

int inPin = 10;   // choose the input pin (for a pushbutton)


Arduino arduino;

String url;
XML rss;
Date timestamp;
int oneHundredPercent = 10; // Number of New Feed Items
float percent = 0;
float previousPercent = -1;
float fakePercent = 0;
int lastTime = 0;
int buttonPin = 10;

boolean presentationMode = true;
int delayBeforeStart = 5;
boolean startMovement = false;

void setup() {
  timestamp = new Date();
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  arduino.pinMode(9, Arduino.SERVO);
  arduino.pinMode(buttonPin, Arduino.INPUT); 
  delay(1000);
  setThermostat(100);
  delay(1000);
  resetThermostat(); 
}

void draw() {
  
  if(millis() - lastTime >= 1000) {

     
     if(presentationMode) {
       if((millis() / 1000) >= delayBeforeStart) {
          startMovement = true;
        }
        if(startMovement && fakePercent < 100) {
          fakePercent += 1;
        }
        if(fakePercent >= 100) { fakePercent = 100; }
        percent = fakePercent;
     } else {
       // println(getFeedItemCount());
       percent = (getFeedItemCount() / oneHundredPercent) * 100;
       if(percent > 100) { percent = 100; }
     }
     
     if(percent != previousPercent) {
       setThermostat(percent);
       println(percent);
     } 
     previousPercent = percent;
     lastTime = millis();
  }

  int val = arduino.digitalRead(inPin);  // read input value
  println (val);
  if (val == Arduino.HIGH) {         // check if the input is HIGH (button released)
    resetThermostat();  
  }
}

public Date parseDate (String dateraw){
        String returndate;

        try {String format = "EEE, dd MMM yyyy kk:mm:ss Z";
        SimpleDateFormat sdf = new SimpleDateFormat("EEE, dd MMM yyyy kk:mm:ss z",Locale.US);
        Date formatedDate = sdf.parse(dateraw);

        Calendar c= Calendar.getInstance();
        c.setTime(formatedDate);

        Date d = c.getTime();

        return d;
        } catch (ParseException e) {
            e.printStackTrace();
            // TODO Auto-generated catch block
            Date leer = null;
            return leer;
        }
}


public int getFeedItemCount() {
  url = "http://www.rssmix.com/u/3865396/rss.xml";  
  rss = loadXML(url);
  int count = 0;
  
  if (rss == null) {
    println("XML could not be parsed.");
  } else {
    XML firstChild = rss.getChild("channel");
    XML itemChildren[] = firstChild.getChildren("item");

    for(int i = 0; i < itemChildren.length; i++) {
      XML child = itemChildren[i];
      Date pubdate = parseDate((child.getChild("pubDate")).getContent());
      if(pubdate.after(timestamp)) {
        count++;
      }
    }
    return count;
  }
  return count;
}

void resetThermostat() {
  percent = 0;
  fakePercent = 0;
  setThermostat(0);
}


void setThermostat(float percent) {
  arduino.servoWrite(9, constrain((int)(percent *1.8), 0, 180));
}
