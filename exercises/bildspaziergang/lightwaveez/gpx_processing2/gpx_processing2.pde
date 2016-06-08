/**
 * @author Monika Hoinkis
 * edited for P2 by Fabian Moron Zirfas
 */
import processing.pdf.*; // this is just for export purpose
Boolean writepdf = false; // if true the sketch will create a PDF


/**
 * create a bounding box world
 * upper left and lower right
 * check out http://dbsgeo.com/latlon/
 * for getting geolocations
 */
// float westlon = 180; // the most left point
// float northlat = 90; // the most top point
// float southlat = -90; // the most bottom point
// float eastlon = -180; // the most right point

/**
 * This is Berlin Potsdam boundng box
 *
 */
// float westlon = 12.9638671875; // the most left point
// float northlat = 52.70468296296834; // the most top point
// float southlat = 52.338695481504814; // the most bottom point
// float eastlon = 13.8153076171875; // the most right point
/**
 * This is Potsdam bounding box
 * 
 */
// float westlon = 12.935028076171875; // the most left point
// float northlat = 52.43299020014247; // the most top point
// float southlat = 52.338695481504814; // the most bottom point
// float eastlon = 13.16436767578125; // the most right point

/**
 * This is near Tempelhofer Feld
 */
float northlat =  52.48821605723852; // the most top point
float westlon = 13.35637092590332; // the most left point
float southlat = 52.47303062367297; // the most bottom point
float eastlon = 13.408255577087402; // the most right point



/**
 * This is Berlin Treptower Park
 *
 */
//float northlat = 52.491181962857084; // the most top point
//float westlon = 13.461813926696777; // the most left point
//float southlat = 52.489013082365126; // the most bottom point
//float eastlon = 13.4637451171875; // the most right point





XML xml; // declare the xml element
PImage img;

void setup() {
  /**
   * IMPORTANT make the sketch size 2:1 
   * this is equirectangular 
   * see --> http://en.wikipedia.org/wiki/Equirectangular_projection
   */
  size(1280, 720);
//  img = loadImage("maps.png");
//  image(img, 0, 0);
   background(255); // white bg

  if(writepdf == true){
    beginRecord(PDF, "gps_track_01.pdf"); 
  }

  xml = loadXML("data/GPS_Tracking_Pattern.gpx"); // this is the file
  XML trk = xml.getChild("trk"); // this is a track
  XML trkseg = trk.getChild("trkseg"); // this is a segemt of a track
  
  noFill();
  stroke(100,200,255);
  strokeWeight(5);
  beginShape();
//  background(100);
  for (int i = 0; i < trkseg.getChildCount(); i++) {
    XML child = trkseg.getChild(i);// get every child of trkseg
    String name = child.getName();
    if (name.equals("trkpt")) {
      float aspectRatio = (eastlon - westlon) / (northlat - southlat);

      float lat = child.getFloat("lat");  // xml attribute lat
      float lon = child.getFloat("lon"); // // xml attribute lon
      // println(lat+" "+lon);
      float x = map(lon, westlon, eastlon, 0, width);    // bereich der gps koodinaten auf den fensterbereich mappen
      float y = map(lat, northlat, southlat, 0, width/aspectRatio);

      vertex(x, y);
    }else{
      /**
       * this is just for debugging
       */
    }
  }
  endShape();
  if(writepdf == true){
  endRecord();
  exit();// and nd the sketch
  }
  saveFrame("screenshot.png");
}