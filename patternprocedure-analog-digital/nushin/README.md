//  Nushin Yazdani, November 2013
//  Kurs: Eingabe/Ausgabe (Basics), Prof. Hoinkis, FH Potsdam
//
//  FUNKTIONSBESCHREIBUNG
//  Dieses Programm erzeugt zufällig gesetzte senkrechte Linien unterschiedlicher Breite, auf denen 
//  wiederum gefüllte und ungefüllte Dreiecke unterschiedlicher Größe liegen; eine Kante des Dreiecks 
//  liegt hierbei direkt auf der Linie.
//  Ein leicht transparenter, überlagernder Hintergrund sorgt dafür, dass sich das Bild nicht immer mehr füllt.



int amount = 200;

float[] x = new float[amount];
float[] y = new float[amount];
float[] hoehe = new float[amount];
float[] breite = new float[amount];
float[] dreieck = new float[amount];

void setup() {
  size(600, 900);
  background(255);
  frameRate(10);
}

void draw() {

  for (int i=0; i<amount; i++) {
    x[i] = random(0, width);
    y[i] = 0;
    hoehe[i] = height;
    breite[i] = random(1, 3);
    dreieck[i] = random(1, 400);
  }

  for (int i=0; i< 5; i++) {

    // senkrechte Linien (bzw. Dreiecke, da sie unterschiedlich breit sein sollen)
    fill(0);
    rect(x[i], y[i], breite[i], hoehe[i]);

    // Dreiecke auf den Linien
    fill(0);
    triangle(x[i], dreieck[i]+random(300, 400), x[i]+random(-44, 44), dreieck[i]+random(300, 310), x[i], dreieck[i]+random(200, 250));
    fill(0);
    triangle(x[i], dreieck[i]+random(10, 40), x[i]+random(-44, 44), dreieck[i]+random(50, 60), x[i], dreieck[i]+random(90, 130));
    noFill();
    triangle(x[i], dreieck[i]+random(80, 120), x[i]+random(-60, 60), dreieck[i]+random(110, 150), x[i], dreieck[i]+random(160, 200));
  }

  // transparentes Rechteck als Hintergrund
  fill(255, 40);
  rect (0, 0, width, height);
}
