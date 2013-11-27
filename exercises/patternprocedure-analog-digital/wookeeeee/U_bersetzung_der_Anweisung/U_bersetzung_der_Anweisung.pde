import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;
float oldX = -1;
float oldY = -1;

void setup() {
  size(842, 595);
  background(255);
  smooth();

  frameRate(1);
}

void draw() {

  smooth();
  fill(0);
  float x = random(width);
  float y = random(height);
    
  if (oldX == -1 && oldY == -1)
  {
    x += width/2;
    y += height/2;
  } else {

    noFill();
    float curveHandleX1 = random (oldX, x);
    float curveHandleX2 = random (oldX, x);
    float curveHandleY1 = random (oldY, y);
    float curveHandleY2 = random (oldY, y);
    bezier( oldX,oldY, curveHandleX1,curveHandleX2, curveHandleX2,curveHandleY2, x, y);
  }
  fill(0);
  ellipse(x, y, 5, 5);
  
  noFill();
  float originX =  random(0, 100);
  float originY =  random(0, 100);
  //line(x,y ,originX+x, originY+y);

  bezier(x, y,  originX+x, originY+y, x - originY, y + originX, x, y);
  bezier(x, y, -(originY)+x, originX+y, x-originX, y-originY, x, y);
  bezier(x, y, x-originX, y-originY, x+originX, y-originY, x, y);
  bezier(x, y, x+originX, y-originY, x+originX, y+originY, x, y);
  oldX = x;
  oldY = y;

} 


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

