int startPosX;
int startPosY;

void setup (){
  size(1280,720);
  smooth();
  startPosX = int(random(0, 1280)); // Zufälliger Startpunkt auf X-Achse
  startPosY = int(random(0, 720)); // Zufälliger Startpunkt auf Y-Achse
  
  background(#ffffff);
  
  stroke(0, 100);
  strokeWeight(0.6); 

  int rangeX = int(random(0, width));
  int endPosX = int(random(0, width - rangeX)); // Breite
 
  int stepsX = int(random(0, 150));
  
  // Dreieck X-Achse

  for(int x = 0; x < rangeX; x+=stepsX){
    line(startPosX, 0, endPosX + x, height);
  }
  
  int rangeY = int(random(0, height));
  int endPosY = int(random(0, height - rangeY)); // Breite
  
  int stepsY = int(random(0, 150));

  // Dreieck Y-Achse

  for(int y = 0; y < rangeY; y+=stepsY){
    line(0, startPosY, width, endPosY + y);
  }
  }
