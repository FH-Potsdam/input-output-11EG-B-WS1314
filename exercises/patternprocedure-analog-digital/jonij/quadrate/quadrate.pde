size(2970, 2100);
noFill();
background(255);
rectMode(CENTER);
strokeWeight(4);

for (int i = 0; i<50; i++){

  int size = int(random(100, 500));
  int rota =   int(random(0,10));
  int posx =  int(random(0+size/1.4, (width-size/1.4)));
  int posy =  int(random(0+size/1.4, (height-size/1.4)));
  pushMatrix();
  translate(posx, posy);
  
  rotate(rota);
  rect(0, 0, size, size);
  popMatrix();
}

saveFrame("screenshot.png");

