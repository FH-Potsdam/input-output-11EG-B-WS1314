class GPXReader{
  /**
   * Simple GPX Reading
   * works with .gpx files created by RunKeeper and GPXMaster
   * not tested with other files
   *
   * we need to pass the PApplet to the class
   * for XML reading
   */
  PApplet sketch; // the PApplet
  ArrayList <Track> tracks; // a list of tracks
  ArrayList <String> files; // a list of files
  
  /**
   * The constructor
   */
  GPXReader(PApplet _sketch, ArrayList<String> in_files ){
    this.sketch = _sketch;// passed PApplet to the local one
    this.files = in_files;// passed filename list to local one
    tracks = new ArrayList<Track>(); // init the tracks

    // loop the files and read the data
    for (int i = 0;i < this.files.size();i++) {
      read(this.files.get(i));// read
    }
  } // end of constuctor

  /**
   * show all that stuff
   */
  void display(){
    // loop the tracks
   for(int i = 0;i < tracks.size(); i++){
     tracks.get(i).display();
   }// end i loop
  } // end void display
  
/**
 * The private method for reading one 
 * GPX file
 * @argument String the filename
 */
private void read(String filename) {
  XMLElement xml = new XMLElement(this.sketch, filename); // this is the file
  Track track = new Track(); // create a new track

  XMLElement trk = xml.getChild("trk"); // this is a track in the gpx file
  // loop all the tracks in the file
  for (int j = 0; j < trk.getChildCount();j++) {
    XMLElement trkseg =  trk.getChild(j);// isolate one tracksegment
    String trkseg_childname = trkseg.getName();// get the name
    // check if there is a child called trkseg
    if (trkseg_childname.equals("trkseg")) {
      Segment seg = new Segment(); // create a new segment
      // loop the track segment from the gpxfile
      for (int i = 0; i < trkseg.getChildCount(); i++) {
        XMLElement child = trkseg.getChild(i);// get every child of trkseg
        String name = child.getName();
        if (name.equals("trkpt")) {
          float lat = child.getFloat("lat");  // xml attribute lat
          float lon = child.getFloat("lon"); // // xml attribute lon
          /**
           * add a new location to the segment
           */
          seg.add_location(new Location(lat, lon));
        // end of if name equals trkpt
        } else {
          /**
           * this is just for debugging
           */
        }//close else no trkpt
      }// close i loop segments
          track.add_segment(seg);
    }// close trkseg check
  }// close j loop tracks
  tracks.add(track);// add the track to our list of tracks
  } // end of private read
} // End of class
