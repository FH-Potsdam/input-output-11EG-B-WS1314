class Track{
/**
 * A simple track list it contains a listof segments
 * and a simple display function
 */
ArrayList <Segment> segments; // list of segments
// simple constructor
Track(){
  segments = new ArrayList<Segment>(); // init the list
  } // end of constructor
  
  /**
   * This adds a segment to the list
   */
  void add_segment(Segment seg){
    segments.add(seg);
  } // end of void add_segment
  
  
  /**
   * simple display function
   */
  void display(){
    // loop the list of segments
    for(int i = 0; i < segments.size();i++){

    beginShape();  // begin drawing the line
    // loop the locations list an an segment
     for(int j =0;j < segments.get(i).locations.size();j++){
       Location loc = segments.get(i).locations.get(j); // isolate a Location
        ScreenPosition pos = map.getScreenPosition(loc); //get the screenposition
        vertex(pos.x,pos.y); // draw a pertex
     }// end of j loop locations
    endShape(); // end drawing
    } // close i segments loop
  } // end of void display
} // end of Track class
