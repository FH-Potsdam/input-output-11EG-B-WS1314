/**
 * A simple file only a reference to the location
 * and a read function for displaying its content
 */
class File{
  String name;
  String path;
  String delimiter;
  File(String _path, String _delimiter){
    this.path = _path;
    this.delimiter = _delimiter;
    String[] list = this.path.split("/"); 
    this.name = list[1]; 
  }

  void read(){
  String lines[] = loadStrings(this.path);
  println("there are " + lines.length + " lines");
    for (int i = 0 ; i < lines.length; i++) {
      println(lines[i]);
    }
  }

  String [] lines(){
    return loadStrings(this.path);
  }
}// end of class file
