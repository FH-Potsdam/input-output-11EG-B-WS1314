/**
 * Based on the unfoldingmaps example 
 * SimpleMarkrApp
 * and
 * gpx_processing
 * https://github.com/FH-Potsdam/gpx_processing
 *
 */
 
// import all the libraries
import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.interactions.*;
import TUIO.*; // <-- Dont forget the TUIO

UnfoldingMap map; // This is our map
TuioCursorHandler tuioCursorHandler; // Handle TUIO

Location locationBerlin = new Location(52.5f, 13.4f); //This is just a location
GPXReader reader;// The reader
ArrayList <String> gpxfiles; // a list of files


public void setup() {
  size(1280, 720, GLConstants.GLGRAPHICS);
    gpxfiles = new ArrayList<String>(); // Make new arraylist for the filenames

  /**
   * Add all the filenames located in the data folder.
   */
  gpxfiles.add("Nush.gpx");
  gpxfiles.add("20131013-18_04_14.gpx");
  gpxfiles.add("20131013-18_18_29.gpx");
  gpxfiles.add("GPXMaster_01.gpx");
  gpxfiles.add("RK_03.gpx");
  gpxfiles.add("RK_04.gpx");
  gpxfiles.add("Running.gpx");
  // --
  gpxfiles.add("2013-11-19_GPS_Anweisung_Nushin.gpx");
  gpxfiles.add("jonij.gpx");
  gpxfiles.add("RK_gpx _2013-11-19_1339.gpx");
  gpxfiles.add("sworn.gpx");
  gpxfiles.add("tomies_anweisung_gpx.gpx");
  gpxfiles.add("Ghost ORIGINAL.gpx");
  // --
  reader = new GPXReader(this, gpxfiles ); // set up the reader
  
  map = new de.fhpotsdam.unfolding.Map(this); // setup the map
  // lots of unfolding map things
  tuioCursorHandler = new TuioCursorHandler(this, map);
  EventDispatcher eventDispatcher = new EventDispatcher();
  eventDispatcher.addBroadcaster(tuioCursorHandler);
  eventDispatcher.register(map, "pan");
  eventDispatcher.register(map, "zoom");
  map.setTweening(true);
  map.zoomToLevel(2);
  map.panTo(locationBerlin);
  MapUtils.createDefaultEventDispatcher(this, map);
  
}

public void draw() {


  background(0);
  map.draw();
   tuioCursorHandler.drawCursors();
  // Draws locations on screen positions according to their geo-locations.
  beginShape();
    noFill(); // dont want fills
  strokeWeight(1);
  stroke(255,0,0);
  reader.display(); // draw the GPX files
}
