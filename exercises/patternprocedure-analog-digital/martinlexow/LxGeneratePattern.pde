//global var
PFont f;
int count=0;
int farbe=0;
int farbRangeMin=10;
int farbRangeMax=220;

void setup() {
  //general
  //size(1920/2, 1080/2); // 1080p
  //size(1280, 720); // 720p
  //size(displayWidth/2, displayHeight/2); // HalfDisplay
  //size(850, 320); //Facebook
  size(1280, 720);
  frameRate(35);
  f = createFont("Arial",10,true);

  //background
  getFarbe();
  int farbeHintergrund;
  farbeHintergrund = getFarbe();
  background(farbeHintergrund);
  
}

void keyPressed() {
  //drawViereck();
  saveFrame(); 
}

void draw() {
  drawViereck();
  
  count = count + 1;
  if(count>50){
    //drawBrand();
    count=0;
  }
  
}
