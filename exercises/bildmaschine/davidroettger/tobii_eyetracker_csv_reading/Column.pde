/**
 * This is a column as you know it from a CSV
 * has a list of cells
 */
class Column{
String head = "";
Header header; // not yet implemented
boolean hasheader = false;
ArrayList <Cell> cells;

  //--------------------------------------
  //  CONSTRUCTOR
  //--------------------------------------

  Column(String _head, boolean _hasheader){
    this.head = _head;
    this.hasheader = _hasheader;
    cells = new ArrayList <Cell>();
  }

/**
 * print everything
 */
void printCellValues(){
  int start = 0;
  if(this.hasheader){
    println("Column: " + this.head);
    start = 1;
      }
  for(int i = start; i < this.cells.size();i++){
    print(this.cells.get(i).getValue() + ", ");
    }
  }
}