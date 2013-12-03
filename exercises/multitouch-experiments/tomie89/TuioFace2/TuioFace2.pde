
// we need to import the TUIO library
// and declare a TuioProcessing client variable
import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;


// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 50;
float table_size = 1100;
float scale_factor = 10;
PFont font;
int tx = 0;
int ty = 0; //definiert 2 globale variablen

void setup()
{
  //size(screen.width,screen.height);
  size(1200,700);
  fill(255);
  strokeWeight(3);
  
  loop();
  frameRate(100);
  //noLoop();

  font = createFont("Chalkduster", 30);
  scale_factor = height/table_size;
  
  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
  background(0);
  
  
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw(){
  
  textFont(font,30*scale_factor);
  face(); //zeichnet den kopf und den schnabel
  eyes(340,height/2,tx,ty);
  eyes(440,height/2,tx,ty);

  //augen(250,height/2); //zeichnet das linke auge
  //augen(350,height/2); //zeichnet das rechte auge
  float cur_size = cursor_size*scale_factor; 
  
  
   Vector tuioCursorList = tuioClient.getTuioCursors();
   
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size() > 0) {
        tx =  tcur.getScreenX(width);
        ty =  tcur.getScreenY(height);
        TuioPoint start_point = (TuioPoint)pointList.firstElement();
        
        for (int j=0;j<pointList.size();j++) {
          
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           
           float startx = start_point.getScreenX(width);
           float starty = start_point.getScreenY(height);  
           float endx = end_point.getScreenX(width);
           float endy = end_point.getScreenY(height);
           
           stroke(255);
           line(startx,starty, endx,endy);
           start_point = end_point;
           
           
           stroke(0);
           
           
       }
        
      }
    } 
      }


        
void face() {  //funktion ohne rückgabewert

fill(255,220,220);
ellipse  (425,405,260,260);
fill(200);
}
 
void eyes(int x,int y,int tx, int ty) { //funktion ohne rückgabewert
fill(255);
ellipse(x+34,y+20,90,90);
//tx=tcur.getScreenX(width);
//ty=tcur.getScreenY(height);
fill(255,0,0);
ellipse(x+tx/18,y+ty/16,45,45);
}

void keyPressed(){
  if(key == 'c'){
    background(0);
  }
}

 

