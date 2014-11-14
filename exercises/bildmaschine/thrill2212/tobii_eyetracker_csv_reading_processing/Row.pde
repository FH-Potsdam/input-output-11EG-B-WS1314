/**
 * This is a row as you know it from a CSV file
 * has a list of cells
 */
class Row {
ArrayList <Cell> cells;
Header header; // not yet implemented
String head;
boolean hasheader = false;

  Row(String _head, boolean _hasheader){
    this.head = _head;
    cells = new ArrayList<Cell>();
    this.hasheader = _hasheader;
 }
}
