/*
    TUIO processing demo - part of the reacTIVision project
    http://reactivision.sourceforge.net/

    Copyright (c) 2005-2009 Martin Kaltenbrunner <mkalten@iua.upf.edu>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
int count=0;
int farbe=0;
int farbRangeMin=20;
int farbRangeMax=255;
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
  
  int shift=100;
  
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

// we need to import the TUIO library
// and declare a TuioProcessing client variable
import TUIO.*;
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
PFont font;

void setup()
{
  //size(screen.width,screen.height);
  background(0);
  size(1280,720);
  noStroke();
  fill(0);
  
  loop();
  frameRate(20);
  //noLoop();
  
  hint(ENABLE_NATIVE_FONTS);
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  
  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw()
{
  //background(0);
  fill(0,0,0,8);
  rect(0, 0, width, height);
  
  textFont(font,18*scale_factor);
  float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor; 
   
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0;i<tuioObjectList.size();i++) {
     TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
     stroke(0);
     fill(0);
     pushMatrix();
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     rotate(tobj.getAngle());
     rect(-obj_size/2,-obj_size/2,obj_size,obj_size);
     popMatrix();
     fill(255);
     text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
   }
   
   Vector tuioCursorList = tuioClient.getTuioCursors();
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size()>0) {
        //stroke(255);
        noStroke();
        strokeWeight(2);
        TuioPoint start_point = (TuioPoint)pointList.firstElement();;
        for (int j=0;j<pointList.size();j++) {
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           line(start_point.getScreenX(width),start_point.getScreenY(height),end_point.getScreenX(width),end_point.getScreenY(height));
           start_point = end_point;
        }
        
        //stroke(192,192,192);
        //fill(192,192,192);
        //fill(255);
        //ellipse(tcur.getScreenX(width)+25, tcur.getScreenY(height)+25,cur_size*2,cur_size*2);
        
        int shift = 25;
        int x1=tcur.getScreenX(width);
        int y1=tcur.getScreenY(height);
        //ecke oben rechts
        int x2=getRndX(x1+shift,width-x1);
        int y2=getRndY(0,width-shift);
        //ecke unten rechts
        int x3=getRndX(x1+shift,width+200);
        int y3=getRndY(y2+shift,height);
        // ecke unten links
        int x4=getRndX(x1-shift,x3-shift); //horizontale
        int y4=getRndY(y1+shift,y3+shift); //vertikale
  
  
  noStroke();
  fill(getFarbeSimple(),int(random(65,100)));
  
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
        
        
        //fill(0);
        //text(""+ tcur.getCursorID(),  tcur.getScreenX(width)-5,  tcur.getScreenY(height)+5);
      }
   }
   
}

// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
          +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
}

void keyPressed() {
  //drawViereck();
  saveFrame(); 
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}
