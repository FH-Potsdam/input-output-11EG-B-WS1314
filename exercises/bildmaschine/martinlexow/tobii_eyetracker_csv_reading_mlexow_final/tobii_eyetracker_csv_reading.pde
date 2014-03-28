/**
 * @author: @fabiantheblind
 * @license: MIT
 * This sketch takes CSV files exported by the tobii eyetracker 1750
 * and displays its gaze points
 */

import processing.pdf.*; // inlcude the pdf lib

CSVFile tobiiexportfile; // the reference to the file
Table table;
Column gazePointX; // a column from the CSV
Column gazePointY; // another column from the CSV
Column timestamp; // and another cpolumn from the CSV
int scaler = 2; // this is for rescaling the whole sketch
ArrayList <CSVFile> csvfiles;
/**
 * some globalb variables for holding values. This enables animations
 */
float oldx;
float oldy;
float oldtimesize = 0;
int tableselect = 0;
int ndx = 0;
boolean exportSequence = true;
boolean exportPDF = true;

void setup(){
  
  
  
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
  csvfiles.add(new CSVFile("csvfiles/LexShort.csv", "\t", true,false));
  //csvfiles.add(new CSVFile("csvfiles/J07.csv", "\t", true,false));
//  csvfiles.add(new CSVFile("csvfiles/Rec 04-All-Data-2stimuli.tsv", "\t", true,false));
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
//  frameRate(25);
  beginRecord(PDF, "everything.pdf");

}


void draw (){
//  println(frameRate);

//  int ndx = frameCount%table.rowcount; // this holds the index of the current row

  float x = gazePointX.cells.get(ndx).getFloatValue() / scaler; // current x position
  float y = gazePointY.cells.get(ndx).getFloatValue() / scaler; // current y position


  /**
   * this is the size of the ellipse based on the time
   * the proband looked at a position
   * @type {float}
   */
  float timesize = timestamp.cells.get(ndx).getFloatValue() /scaler;
   println(ndx + " timesize: " + timesize); // just to see
  //
  /**
   * calc the width based on the timesize
   * @type {[type]}
   */
  float w = timesize - oldtimesize;
  float h = w; // just a circle
  //fill(100,238,238,10);// now fill it black
  //noStroke();
  //ellipse(x, y, w*2, h*2);// draw all that stuff
  
  float x1=x;  //float: x-coordinate of the first corner
  float y1=y;  //float: y-coordinate of the first corner
  float x2=x1+random(10,50);  //float: x-coordinate of the second corner
  float y2=y1+random(-50,50);  //float: y-coordinate of the second corner
  float x3=x2+random(10,50);  //float: x-coordinate of the third corner
  float y3=y2+random(-50,50);  //float: y-coordinate of the third corner
  float x4=x3+random(10,50);  //float: x-coordinate of the fourth corner
  float y4=y3+random(-50,50);  //float: y-coordinate of the fourth corner
  
  fill(100,238,238,3);// now fill it black
  //fill(0,139,0,10);
  noStroke();
  ellipse(x, y, w*5, h*5);// draw all that stuff

  
  fill(100,238,238,10);// now fill it black
  noStroke();
  quad(x, y1, x2, y2, x3, y3, x4, y4);
  
    
     x1=x;  //float: x-coordinate of the first corner
   y1=y;  //float: y-coordinate of the first corner
   x2=x1+random(10,50);  //float: x-coordinate of the second corner
   y2=y1+random(-50,50);  //float: y-coordinate of the second corner
   x3=x2+random(10,50);  //float: x-coordinate of the third corner
   y3=y2+random(-50,50);  //float: y-coordinate of the third corner
   x4=x3+random(10,50);  //float: x-coordinate of the fourth corner
   y4=y3+random(-50,50);  //float: y-coordinate of the fourth corner
  
  fill(0,104,139,15);// now fill it black
  noStroke();
  quad(x, y1, x2, y2, x3, y3, x4, y4);
  
  
 
  
  //ellipse(x, y, timesize/10, timesize/10);
  noFill();// dont fill
  //fill(0,104,139,15);
  //stroke(0,104,139,15);
  //line(x,y,oldx,oldy); // draw the line from the old x/y to the current x/y
  oldx = x;// store current x as oldx
  oldy = y;// store current y as oldy

  oldtimesize = timesize;// store the old size

  /**
   * just stop it all when there are no more cells
   * @type {[type]}
   */
   ndx++;
   if(exportSequence) sequenceExporter();

 if(ndx == table.rowcount-1){
  // exit();
      tableselect++;

if(  tableselect < csvfiles.size()){
      gettable();

}else if(tableselect == csvfiles.size()){
    if(!exportPDF){
      noLoop();
    }else{
       endRecord();
      exit();
       
    }

}
//  if(tableselect >= csvfiles.size()  ){
//    
//    noLoop();
//  }
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
void keyPressed() {
  if (key == 's' || key == 'S') {
      saveFrame("screen" + timestamp() + ".png");
    }
}


void sequenceExporter(){

  //saveFrame(csvfiles.get(tableselect).name+"/screen-#####.png");
}
