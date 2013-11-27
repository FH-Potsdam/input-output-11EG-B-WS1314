int getFarbe(){
  
  println("farbRangeMin: " + farbRangeMin);
  println("farbRangeMax: " + farbRangeMax);
  
  if(farbRangeMin<=0 || farbRangeMin>=220){
    farbRangeMin = 10;
  }
  
  if(farbRangeMax>=220 || farbRangeMax<=0){
    farbRangeMax = 220;
  }
  
  if(farbe<=0){
    farbRangeMin=10;
    farbRangeMax=220;
  }
  
  if(farbe<112 && farbe>0){
    farbRangeMin=farbRangeMin-5;
    farbRangeMax=farbRangeMax-5;
  }
  
  if(farbe>112 && farbe>0){
    farbRangeMin=farbRangeMin+5;
    farbRangeMax=farbRangeMax+5;
  }
  
  farbe = int(random(farbRangeMin,farbRangeMax));

  println("Farbe:" + farbe);
  
  return(farbe);
}

int getFarbeSimple(){
  farbe = int(random(farbRangeMin,farbRangeMax));
  return(farbe);
}

int getRndX(int von, int bis){
  int rndX = int(random(von,bis));
  //println("X: von " + von + " bis " + bis + " / rndX:" + rndX);
  return(rndX);
}

int getRndY(int von, int bis){
  int rndY = int(random(von,bis));
  //println("Y: von " + von + " bis " + bis + " / rndY:" + rndY);
  return(rndY);
}

void drawBrand(){
  //branding
  int brandShiftX = width-100;
  int brandShiftY = height-75;
  noStroke();
  fill(255, 75);
  quad(0+brandShiftX, 0+brandShiftY, 50+brandShiftX, 7+brandShiftY, 46+brandShiftX, 29+brandShiftY, 8+brandShiftX, 32+brandShiftY);
}

void drawViereck(){
  
  int shift=75;
  
  //ecke oben links
  int x1=int(random(0-shift,width+shift));
  int y1=int(random(0-shift,height+shift));
  //ecke oben rechts
  int x2=getRndX(x1+shift,width-x1);
  int y2=getRndY(0,width-shift);
  //ecke unten rechts
  int x3=getRndX(x1+shift,width+shift);
  int y3=getRndY(y2+shift,height);
  // ecke unten links
  int x4=getRndX(x1-shift,x3-shift); //horizontale
  int y4=getRndY(y1+shift,y3+shift); //vertikale
  
  
  noStroke();
  fill(getFarbeSimple(),int(random(65,100)));
  
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
  
  // debugging
  //fill(255);
  //textFont(f,10);
  //text("oben links",x1,y1);
  //text("oben rechts",x2,y2);
  //text("unten rechts",x3,y3);
  //text("unten links",x4,y4);
  //println("oben links: x1:" + x1 + " / y1:" + y1);
  //println("oben rechts: x2:" + x2 + " / y2:" + y2);
  //println("unten rechts: x3:" + x3 + " / y3:" + y3);
  //println("unten links: x4:" + x4 + " / y4:" + y4);

}
