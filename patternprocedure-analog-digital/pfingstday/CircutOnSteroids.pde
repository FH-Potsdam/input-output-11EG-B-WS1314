float px;
float py;

void setup() {
  
  size(1440, 890);                        // A4 Verhältnis
  smooth();
  background(255);                        // Papierfarbe
  frameRate(30);

  strokeWeight(2);                        // Definition Linien-Stärke
  fill(0);                                // Definition Kreis Farbe
}

void draw() {
  
  //rotate(radians(45));                  // Canvas Rotation um 45° Grad
  //translate(0,-450);
  
  px = constrain(px, 0, width);           // Außerhalb des Papiers wird nicht gemalt!
  py = constrain(py, 0, height);
  
  float y = py + random(-500, 500);       // Linienlänge nicht definiert = Zufall
  float x = px + random(-500, 500);  


  for (int i = 0; i < 2; i = i + 1) {     // Linien stehen stehts orthogonal zueinander

    if (i%2 == 0) {
      println("horizontal");              // Zeiche horizontale Linien ...
      
      line(px, py, x, py);
      ellipse(px, py, 7, 7);

      px = x;
      
    }
    else {
      println("vertical");                // ... und vertikale Linie im Wechsel
      
      line(px, py, px, y);                // ... die stets durch einen Punkt verbunden sind
      ellipse(px, y, 7, 7);

      py = y;
    }

  }
  
  
}

void mousePressed() {
  background(255);
}


