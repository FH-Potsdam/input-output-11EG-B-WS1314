class Segment{
	/**
	 * A simple segment class
	 * a segmant is a part of a track
	 * and is made of a list of Locations
	 * The locations are part of the unfolding lib
	 */
  ArrayList<Location> locations; // the list

  Segment(){
  	// constructor
    locations = new ArrayList<Location>(); // init the list
  } // end of constructor
  
  /**
   * add a Location to the list
   */
  void add_location(Location loc){
    locations.add(loc);
  } // end of void add_location
} // end of class
