import processing.pdf.*;
import ddf.minim.*;
import ddf.minim.ugens.*;


PGraphics flare;
PShape dreieck;  // The PShape object


CSVFile tobiiexportfile; // the reference to the file
Table table;
Column gazePointX; // a column from the CSV
Column gazePointY; // another column from the CSV
Column timestamp; // and another cpolumn from the CSV
int scaler = 1; // this is for rescaling the whole sketch
/**
 * some globalb variables for holding values. This enables animations
 */
float oldx;
float oldy;
float oldtimesize = 0;
int count = 0;

void setup(){
  /**
   * This is a CSV file
   * @type {CSVFile}
   * @argument path {String} the path to the file
   * @argument delimiter {String} the cell delimiter in the CSV
   * @argument hascolumnheader {boolean} if the CSV has headers in the columns, set this to true
   * @argument hasrowheader {boolean} if the CSV has headers in the rows, set this to true
   *
   *
   */
  tobiiexportfile = new CSVFile("csvfiles/egowolke.tsv", "\t", true,false);



  table = tobiiexportfile.tables.get(0);// this is the one and only table right now
  table.printHeaders(); // print all the headers to the console
  timestamp = table.columns.get(0); // this is the timestamp column
  gazePointX = table.columns.get(19); // this is the X view point
  gazePointY = table.columns.get(20); // this is the Y view point

// timestamp.printCellValues(); // you could print all the values of the cell
//
  size(1280 / scaler , 1024/ scaler, OPENGL); // now set the size and scale it
  smooth(8);
  oldx = width/2; // we need to start somewhere bette the center then the 0
  oldy = height/2;// we need to start somewhere bette the center then the 0
  colorMode(HSB, 100);
  blendMode(ADD);
  background(0); // draw it one
    flare = createGraphics(200, 200);

  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  dreieck = createShape();
  dreieck.beginShape(TRIANGLES);
  dreieck.vertex(0-(56/2), 55-(35));
  dreieck.vertex(28-(56/2), 0-(35));
  dreieck.vertex(56-(56/2), 55-(35));
  dreieck.endShape();

}


void draw (){

  count = count+1;
  if (count > 25) {count = 0;}


  int ndx = frameCount%table.rowcount; // this holds the index of the current row

  float x = gazePointX.cells.get(ndx).getFloatValue() / scaler; // current x position
  float y = gazePointY.cells.get(ndx).getFloatValue() / scaler; // current y position


  /**
   * this is the size of the ellipse based on the time
   * the proband looked at a position
   * @type {float}
   */
  float timesize = timestamp.cells.get(ndx).getFloatValue() /scaler;
  //println(ndx + " timesize: " + timesize); // just to see
  
  //
  /**
   * calc the width based on the timesize
   */
  float w = timesize - oldtimesize;
  float h = w; // just a circle
  println(count); // just to see
  fill(100);// dont fill
  fill(map(timesize,60500,115494,0,90),80,100,25);// now fill it black
  //fill(map(w,8,12,0,100),100,100,25);// now fill it black
  
  noStroke();
  line(x,y,oldx,oldy); // draw the line from the old x/y to the current x/y
  if (count == 0) {
    //ellipse(x, y, w*4, h*4);// draw all that stuff
     pushMatrix();
 translate(x-100, y-100);
 flare.beginDraw();
 flare.colorMode(HSB, 100);
 flare.background(0);
 flare.noStroke();
 flare.fill(random(0,100),80,100,10);
 flare.ellipse(100,100,50,50);
 flare.filter(BLUR, random(1,5));
 flare.endDraw();
 image(flare, 0, 0); 
 popMatrix();

  }







  pushMatrix();
  translate(x, y);
  rotate(random(0,5));
  dreieck.setFill(color(map(timesize,115494,177437,0,90),80,100,5));
  dreieck.setStroke(color(map(timesize,115494,177437,0,90),80,100,25));
  float trisize = random(15,45);
  //shape(dreieck, 0, 0, trisize, trisize);
  //triangle(0-(56/2), 55-(35), 28-(56/2), 0-(35), 56-(56/2), 55-(35));
  popMatrix();



  oldx = x;// store current x as oldx
  oldy = y;// store current y as oldy

  oldtimesize = timesize;// store the old size

  /**
   * just stop it all when there are no more cells
   * @type {[type]}
   */
 if(ndx == table.rowcount-1){
  // exit();
  noLoop();
 }



}// end draw


/**
 * nothing fancy just creating unique names of images
 */
String timestamp(){
int day = day();
int month = month();
int year = year();
int hour = hour();
int minute = minute();
int second = second();

return ( str(year) + str(month) + str(day) + str(hour) + str(minute) + str(second) );
} // end timestamp

/**
 * if you press s or S it saves a frame
 */
void keyPressed() {
  if (key == 's' || key == 'S') {
      saveFrame("screen" + timestamp() + ".png");
    }
}
