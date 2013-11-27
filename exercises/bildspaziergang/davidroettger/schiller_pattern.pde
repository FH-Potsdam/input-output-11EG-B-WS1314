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
 * This is campus FHP bounding box
 */
//float northlat = 52.41388560511059; // the most top point
//float westlon = 13.04952621459961; // the most left point
//float southlat = 52.41269456515949; // the most bottom point
//float eastlon = 13.051897287368774; // the most right point

/* campus FHP zoom area */
//float northlat = 52.413026685303024; // the most top point
//float westlon = 13.04976224899292; // the most left point
//float southlat = 52.41240988876014; // the most bottom point
//float eastlon = 13.050073385238647; // the most right point


/* Schillerkiez*/
float northlat = 52.48032342233942; // the most top point
float westlon = 13.414092063903809; // the most left point
float southlat = 13.415894508361816; // the most bottom point
float eastlon = 13.432846069335938; // the most right point

/* Tempelhofer Feld*/
//float northlat = 52.482048423737105; // the most top point
//float westlon = 13.384866714477539; // the most left point
//float southlat = 52.467619056477965; // the most bottom point
//float eastlon = 13.424263000488281; // the most right point


/**
 * This is Berlin Treptower Park
 *
 */
//float northlat = 52.491181962857084; // the most top point
//float westlon = 13.461813926696777; // the most left point
//float southlat = 52.489013082365126; // the most bottom point
//float eastlon = 13.4637451171875; // the most right point





XML xml; // declare the xml element


void setup() {
  /**
   * IMPORTANT make the sketch size 2:1 
   * this is equirectangular 
   * see --> http://en.wikipedia.org/wiki/Equirectangular_projection
   */
  size(600, 300);
  background(255); // white bg

  if(writepdf == true){
    beginRecord(PDF, "gps_track_01.pdf"); 
  }

  xml = loadXML("david2.gpx"); // this is the file
  XML trk = xml.getChild("trk"); // this is a track
  XML trkseg = trk.getChild("trkseg"); // this is a segemt of a track
  // strokeWeight(3);
  noFill();
  beginShape();
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
  saveFrame("screen.png");
}

