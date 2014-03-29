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
ArrayList <CSVFile> csvfiles;
/**
 * some globalb variables for holding values. This enables animations
 */
float oldx;
float oldy;
float oldtimesize = 0;
int tableselect = 0;
int ndx = 0;
boolean exportSequence = false;

float ball = 9.0;
//random(5.0);


void setup(){

//frameRate(25);
  /**
   * This is a CSV file list
   * @type {CSVFile}
   * @argument path {String} the path to the file
   * @argument delimiter {String} the cell delimiter in the CSV
   * @argument hascolumnheader {boolean} if the CSV has headers in the columns, set this to true
   * @argument hasrowheader {boolean} if the CSV has headers in the rows, set this to true
   *
   *
   */
  csvfiles = new ArrayList<CSVFile>();

//csvfiles.add(new CSVFile("csvfiles/J01.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J02.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J03.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J04.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J05.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J06.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J07.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J08.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J09.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J10.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J11.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J12.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J13.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J14.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J15.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J16.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J17.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J18.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J19.csv", "\t", true,false));
csvfiles.add(new CSVFile("csvfiles/J20.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J21.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J22.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J23.csv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/J24.csv", "\t", true,false));
//  csvfiles.add(new CSVFile("csvfiles/Rec 04-All-Data-2stimuli.tsv", "\t", true,false));
//csvfiles.add(new CSVFile("csvfiles/tobii-CSVExport-All-Data-noheader-nofilter.tsv", "\t", true,false));
  ////csvfiles.add(new CSVFile("csvfiles/Rec 04-All-Data-2stimuli.tsv", "\t", true,false));

//  csvfiles.add(new CSVFile("csvfiles/Rec 01.tsv", "\t", true,false));
//  csvfiles.add(new CSVFile("csvfiles/Rec 02.tsv", "\t", true,false));
//  tobiiexportfile = new CSVFile("csvfiles/tobii-CSVExport-All-Data-noheader-nofilter.tsv", "\t", true,false);



// timestamp.printCellValues(); // you could print all the values of the cell
//
  size(1280 / scaler , 1024/ scaler); // now set the size and scale it
  oldx = width/2; // we need to start somewhere bette the center then the 0
  oldy = height/2;// we need to start somewhere bette the center then the 0
  background(255); // draw it one
  gettable();
    beginRecord(PDF, "everything.pdf");
}


void draw (){
//  int ndx = frameCount%table.rowcount; // this holds the index of the current row

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
  float w = timesize - oldtimesize;
  float h = w; // just a circle
  stroke(0,30);
  fill(0,30);// now fill it black
ellipse(x, y, ball, ball);// draw all that stuff
 strokeWeight(1);
  stroke(0,20);
  //noFill();// dont fill
  line(x,y,oldx,oldy); // draw the line from the old x/y to the current x/y
  oldx = x;// store current x as oldx
  oldy = y;// store current y as oldy

  oldtimesize = timesize;// store the old size

  /**
   * just stop it all when there are no more cells
   * @type {[type]}
   */
   if(exportSequence) sequenceExporter();
   ndx++;
 if(ndx == table.rowcount-1){
  // exit();
      tableselect++;

if(  tableselect < csvfiles.size()){
      gettable();

}else if(tableselect == csvfiles.size()){
//noLoop();
}
  if(tableselect >= csvfiles.size()  ){
//
//    noLoop();
    endRecord();
    exit();
  }
 }
 
  

}// end draw

void gettable(){
  ndx = 0;
  table = csvfiles.get(tableselect).tables.get(0);// this is the one and only table right now
  table.printHeaders(); // print all the headers to the console
  timestamp = table.columns.get(0); // this is the timestamp column
  gazePointX = table.columns.get(19); // this is the X view point
  gazePointY = table.columns.get(20); // this is the Y view point
}

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
//void keyPressed() {
//  if (key == 's' || key == 'S') {
//      saveFrame("screen" + timestamp() + ".png");
//    }
//}

//void keyPressed() {
//  if (key == 'q') {
//    endRecord();
//    exit();
//  }
//}

void sequenceExporter(){

  saveFrame(csvfiles.get(tableselect).name+"/screen-#####.png");
}
