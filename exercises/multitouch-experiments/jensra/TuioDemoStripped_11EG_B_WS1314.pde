/*
    Edited by Jens Rauenbusch (@jensra), FH Potsdam
    November 2013

    OPEN WITH PROCESSING 1.5 AND USE TRACKPAD-MULTITOUCH-SIMULATOR-THINGY-SOFTWARE
    WITH THIS SKETCH; I recommend using Tongseng,
    which can be found here: https://github.com/fajran/tongseng

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

void setup()
{
  //size(screen.width,screen.height);
  size(640,480);
  background(255);
  noStroke();
  fill(0);
  
  loop();
  frameRate(30);
  
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  
  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
  
}

void draw(){
  
  float cur_size = cursor_size*scale_factor; 
   Vector tuioCursorList = tuioClient.getTuioCursors();
  for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size() > 0) {
        //creating rectangles with which you can draw on canvas

        //randomly greyish and slightly transparent:        
        fill(int(random(0,150)),100);
        
        //ellipse( tcur.getScreenX(width), tcur.getScreenY(height), cur_size, cur_size);
        //create rectangles at the coordinates of your fingers at a medium size
        rect( tcur.getScreenX(width), tcur.getScreenY(height), cur_size*3, cur_size*3);
      }
      
  }
  
}
   

