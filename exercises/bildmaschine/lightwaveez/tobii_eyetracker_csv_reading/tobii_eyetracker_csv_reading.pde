/**
 * @author: @fabiantheblind
 * @license: MIT
 * This sketch takes CSV files exported by the tobii eyetracker 1750
 * and displays its gaze points
 */
import processing.pdf.*;

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
  tobiiexportfile = new CSVFile("csvfiles/tobii-CSVExport-All-Data-noheader-nofilter.tsv", "\t", true,false);


  table = tobiiexportfile.tables.get(0);// this is the one and only table right now
  table.printHeaders(); // print all the headers to the console
  timestamp = table.columns.get(0); // this is the timestamp column
  gazePointX = table.columns.get(19); // this is the X view point
  gazePointY = table.columns.get(20); // this is the Y view point

// timestamp.printCellValues(); // you could print all the values of the cell
//
  size(1280, 1024); // now set the size and scale it
  oldx = width/2; // we need to start somewhere bette the center then the 0
  oldy = height/2;// we need to start somewhere bette the center then the 0
  background(255); // draw it one

  beginRecord(PDF, "PDF_Export.pdf");
}

void draw (){
  int ndx = frameCount%table.rowcount; // this holds the index of the current row

  float x = gazePointX.cells.get(ndx).getFloatValue() / scaler; // current x position
  float y = gazePointY.cells.get(ndx).getFloatValue() / scaler; // current y position


  /**
   * this is the size of the ellipse based on the time
   * the proband looked at a position
   * @type {float}
   */
  float timesize = timestamp.cells.get(ndx).getFloatValue() /scaler;
  // println(ndx + " timesize: " + timesize); // just to see
  //
  /**
   * calc the width based on the timesize
   * @type {[type]}
   */
  float w = timesize - oldtimesize + 20;
  float h = w; // just a circle
  stroke(0);
  strokeWeight(1);
  line(x,y,oldx,oldy); // draw the line from the old x/y to the current x/y
  oldx = x;// store current x as oldx
  oldy = y;// store current y as oldy

  oldtimesize = timesize;// store the old size

  /**
   * just stop it all when there are no more cells
   * @type {[type]}
   */
// if(ndx == table.rowcount-1){
//  // exit();
//  noLoop();
// }
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
      // saveFrame("screen" + timestamp() + ".png");
      endRecord();
    }
}
