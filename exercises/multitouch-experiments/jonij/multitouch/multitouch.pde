import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;


float scale_factor = 1;
float max_distance;
ArrayList<Box> boxes;

PBox2D box2d;		

void setup() {
  size(displayWidth,displayHeight);
  smooth();
  loop();
  colorMode(HSB, 100);  
  max_distance = dist(0, 0, width, height);
  tuioClient  = new TuioProcessing(this);
  box2d = new PBox2D(this);	
  box2d.createWorld();
  boxes = new ArrayList<Box>();
}

void draw() {
  background(0);
  
  box2d.step();    

   Vector tuioCursorList = tuioClient.getTuioCursors();
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
    Box p = new Box(tcur.getScreenX(width),tcur.getScreenY(height));
    boxes.add(p);


        
      }


  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}
