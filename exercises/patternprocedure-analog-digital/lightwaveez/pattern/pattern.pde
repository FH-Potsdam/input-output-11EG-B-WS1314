float rX1 = 0;
float rX2 = 0;
float rY1 = 0;
float rY2 = 0;

float rR1 = 0;
float rR2 = 0;
float startX = 0;
float startY = 0;

boolean ende = false;

void setup() {
  frameRate(1);
  background(255);
  size(1280,700);
  size(width, height);
  ellipseMode(CENTER);
}

void draw() {
  if(ende == false) {
    stroke(0);
    strokeWeight(2);
    fill(255);
    
    rX1 = random(0, width);
    rY1 = random(0, height);
    
    startX = rX1;
    startY = rY1;
    
    for (int i = 0; i < 15; i = i+1) {
      
      rX2 = random(0, width);
      rY2 = random(0, height);
      
      line(rX1,rY1,rX2,rY2);
      
      rX1 = rX2;
      rY1 = rY2;
      
      rR1 = random(40,90);
      rR2 = random(5, rR1-10);
      ellipse(rX2,rY2,rR1,rR1);
      ellipse(rX2,rY2,rR2,rR2);
    }
    
    line(startX,startY,rX2,rY2);
    ellipse(startX,startY,rR1,rR1);
    ellipse(startX,startY,rR2,rR2);
  }
  ende = true;
  
}
