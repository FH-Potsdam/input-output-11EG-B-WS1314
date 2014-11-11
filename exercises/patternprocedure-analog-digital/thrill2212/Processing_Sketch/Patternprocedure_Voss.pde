float y = 100;
int c = 0;
// Varianz
void setup() {
  size(800, 600);
  stroke(255);
  frameRate(80);
  background(0);
}

void draw() {
  fill(255, 255, 255, 1);
  pushMatrix();
  
  // Grosses Dreieck
  triangle(width/2, height/20*1, width/20*1, height/4*3, width/20*19, height/4*3);
  
  // Kleines Dreieck\\
  triangle(width/2, height/6*4, width/10*3, height/5*2, width/10*7, height/5*2);
  popMatrix();

//Geraden
  stroke(0);
  strokeWeight(int(random(1,5)));
  line(random(0, 1680), random(0, 1050), random(0, 1680), random(0, 1050));
}
