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

// we need to import the TUIO library
// and declare a TuioProcessing client variable

boolean sketchFullScreen() {
  return true;
}

import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;

PImage img;
PImage img02;
// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float table_size = 760;
float scale_factor = 1;
PFont font;

void setup()
{
  //size(screen.width,screen.height);
  size(displayWidth, displayHeight);
  noStroke();
  fill(0);
  background(255);  
  loop();
  frameRate(40);
  img = loadImage("finger.png");
  img02 = loadImage("finger02.png");
  
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
  
  textFont(font,18*scale_factor);
  float cur_size = cursor_size*scale_factor; 
  
   Vector tuioCursorList = tuioClient.getTuioCursors();
   
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size() > 0) {
        stroke(0,0,255,0);
        strokeWeight(5);
        TuioPoint start_point = (TuioPoint)pointList.firstElement();

        
        for (int j=0;j<pointList.size();j++) {
           
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           
           float startx = start_point.getScreenX(width);
           float starty = start_point.getScreenY(height);  
           float endx = end_point.getScreenX(width);
           float endy = end_point.getScreenY(height);
           
           line(startx,starty, endx,endy);
           start_point = end_point;  
           image(img02, (startx-50), (starty-50));
        }
        fill(255,255,255,100);
        rect(0,0,width,height);
        stroke(192,192,192);
        fill(192,192,192);
 //       ellipse( tcur.getScreenX(width), tcur.getScreenY(height), cur_size, cur_size);
        fill(0);
        image(img, (tcur.getScreenX(width)-50), (tcur.getScreenY(height)-50));
        text(""+ tcur.getCursorID(),  tcur.getScreenX(width)-5,  tcur.getScreenY(height)+5);
      }
   }
   
}


