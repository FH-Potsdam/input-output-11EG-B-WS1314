public class Table {

  //--------------------------------------
  //  CONSTRUCTOR
  //--------------------------------------

public ArrayList <Header> headers;
  public ArrayList <Column> columns;
  public ArrayList <Row> rows;
  public ArrayList <Cell> cells;
  private boolean hasrowheader = false;
  private String delimiter = "\t";
  public boolean hascolumnheader = false;
  private int columncount = 0;
  private int rowcount = 0;
  private String [] lines;

  //--------------------------------------
  //  CONSTRUCTOR
  //--------------------------------------

  public Table(String [] _lines, String _delimiter, boolean _hascolumnheader, boolean _hasrowheader){
    this.lines = _lines;
    this.delimiter = _delimiter;
    this.hasrowheader = _hasrowheader;
    this.hascolumnheader = _hascolumnheader;
    if(this.hascolumnheader){
    this.headers = new ArrayList<Header>();
      get_headers();
    }
    this.headers = new ArrayList<Header>();
    this.cells = new ArrayList<Cell>();
    this.columns = new ArrayList<Column>();
    this.rows = new ArrayList<Row>();
    init();

  }
  /**
   * Print all headers of the columns
   */
  public void printColumnHeaders(){
    if(this.hascolumnheader){
      for(int i = 0; i < this.columns.size();i++){
        println("Column: " + i + " --> " + this.columns.get(i).head);
      }
    }else{
      println("This Table has no column headers");
    }
  }

  /**
   * Print all headers of the columns
   */
  public void printRowHeaders(){
    if(this.hasrowheader){
      for(int i = 0; i < this.rows.size();i++){
        println("Row: " + i + " --> " + this.rows.get(i).head);
      }
    }else{
      println("This Table has no row headers");
    }
  }

public void printHeaders(){
  this.printColumnHeaders();
  this.printRowHeaders();
}


  private String fix_decimal_delimiter(String str){
    return str.replaceAll(",",".");
  }


private void init(){
  init_cells(); // needs to be first
  // init_row();
  init_columns();

}
private void init_cells(){
    // String [] lines = this.lines();
    this.rowcount = lines.length;
    for(int j = 0; j < this.lines.length;j++){
      String [] vals = split(lines[j], this.delimiter);
      this.columncount  = vals.length;
        int ndx = 0;
      for(int r = 0; r < vals.length;r++){
        this.cells.add(new Cell(ndx,fix_decimal_delimiter(vals[r])));
        ndx++;
      }
    }
}

private void init_columns(){
  for(int i = 0; i < this.columncount;i++){
    this.columns.add(new Column("",this.hascolumnheader));
  }
    Column currColumn;
  for(int c = 0; c < this.cells.size();c++){
      currColumn = this.columns.get(c%this.columncount);

      if((c <  this.columncount) &&(this.hascolumnheader == true)){
        currColumn.head = this.cells.get(c).getStringValue();
      }
      currColumn.cells.add(this.cells.get(c));
  }
}



  private void init_rows() {

  for(int i = 0; i < this.rowcount;i++){
    this.rows.add(new Row("",this.hasrowheader));
  }
    Row currRow;
  for(int r = 0; r < this.cells.size();r++){
      currRow = this.rows.get(r%this.rowcount);
      if((r < this.rowcount) &&(this.hasrowheader == true)){
        currRow.head = this.cells.get(r).getStringValue();
      }
      currRow.cells.add(this.cells.get(r));
  }


  }

  private void get_headers(){
    // String [] lines = this.lines();
    String [] headstrings = split(this.lines[0], this.delimiter);
    for(int i = 0; i < headstrings.length;i++){
      if(headstrings[i].length() > 0){
      this.headers.add(new Header(headstrings[i]));
      }
    }
  }
}
