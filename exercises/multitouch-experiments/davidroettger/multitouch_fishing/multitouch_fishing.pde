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
import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;


// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float table_size = 760;
float scale_factor = 1;
PFont font;

PShape fisch;
PShape haken;
float fisch_x = 300;
int angelposi = 1; 

int[] oberkante = {100,200,300,400,500,600};


void setup()
{
  //size(screen.width,screen.height);
  size(640,480);
  noStroke();
  fill(0);
  
  loop();
  frameRate(30);
  
  font = createFont("Arial", 18);
  scale_factor = height/table_size+2;
  fisch = loadShape("fisch.svg");
  haken = loadShape("haken.svg");

  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw(){
  
  
  background(255);
  textFont(font,18*scale_factor);
  float cur_size = cursor_size*scale_factor; 
  
  
  if (fisch_x > 0) {
  shape(fisch, fisch_x,300); 
  fisch_x -= 2; 
  }
  
  else{
  fisch_x = width;
  }
 
    
  
  println(fisch_x);
  
   Vector tuioCursorList = tuioClient.getTuioCursors();
   
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size() > 0) {
        stroke(0,0,255);
        TuioPoint start_point = (TuioPoint)pointList.firstElement();
        
        
        for (int j=0;j<pointList.size();j++) {
          
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           
           float startx = start_point.getScreenX(width);
           float starty = start_point.getScreenY(height);  
           float endx = end_point.getScreenX(width);
           float endy = end_point.getScreenY(height);
           
           //line(startx,starty, endx,endy);
           start_point = end_point;
        }
        
        stroke(192,192,192);
        fill(192,192,192);
        
        if(start_point.getScreenY(height) < height/2) {
        //ellipse( tcur.getScreenX(width), tcur.getScreenY(height), cur_size, cur_size);
       shape(haken,tcur.getScreenX(width), tcur.getScreenY(height));
        }
        else {
          fill (255,0,0);
          rectMode(CENTER);
          shape(haken,tcur.getScreenX(width), tcur.getScreenY(height));
        }
        
        if (angelposi < 5) {
          angelposi += 1;}
        
        line (start_point.getScreenX(width),start_point.getScreenY(height),oberkante[angelposi],0);    
       
        fill(0);
        //text(""+ tcur.getCursorID(),  tcur.getScreenX(width)-5,  tcur.getScreenY(height)+5);
        //println (start_point.getScreenX(width)+" "+start_point.getScreenY(height));
        
      }
   }
   
}


