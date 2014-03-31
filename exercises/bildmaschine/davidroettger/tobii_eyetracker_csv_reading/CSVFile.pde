/**
 * Pretty nice CSVFile class needs more comments
 */
class CSVFile extends File {

  public ArrayList <Table> tables;
  private boolean hasrowheader = false;
  public boolean hascolumnheader = false;
  //--------------------------------------
  //  CONSTRUCTOR
  //--------------------------------------

  public CSVFile(String _path, String _delimiter, boolean _hascolumnheader, boolean _hasrowheader){
    super(_path, _delimiter);
    tables = new ArrayList<Table>();
    this.hascolumnheader = _hascolumnheader;
    this.hasrowheader = _hasrowheader;
    init();
  }

  private void init(){
    tables.add(new Table(super.lines(), super.delimiter, this.hascolumnheader, this.hasrowheader));
  }
}
