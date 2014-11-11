//        Philipp Voss 2013
        
 //       University of Applied Science Potsdam
	
//	Eingabe, Ausgabe. Grundlagen der prozessorientierten Gestaltung
//	by Prof. Monika Hoinkis & Fabian Morón Zirfas


import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;


// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float table_size = 760;
float scale_factor = 1;
PFont font;

void setup()
{
  //size(screen.width,screen.height);
  size(1280,720);
  noStroke();
  fill(0);
  
  loop();
  frameRate(25);
  
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  
  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw(){
  background(255);
  float cur_size = cursor_size*scale_factor; 
  
   Vector tuioCursorList = tuioClient.getTuioCursors();
   
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size() > 0) {
        stroke(255, 50, 100, 50);
        noFill();
        strokeWeight(5);
        smooth();
        TuioPoint start_point = (TuioPoint)pointList.firstElement();
        
        
        for (int j=0;j<pointList.size();j++) {
          
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           
           float startx = start_point.getScreenX(width);
           float starty = start_point.getScreenY(width);  
           float endx = end_point.getScreenX(width);
           float endy = end_point.getScreenY(height);
           
           ellipse(mouseX, starty/2, endx,endy);
           start_point = end_point;
        }
        
        stroke(0);
        fill(0);
        fill(0);
      }
   }
   
}


