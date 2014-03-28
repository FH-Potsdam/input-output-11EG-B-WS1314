/**
 * The cell class the heart of a CSV
 */
class Cell {

  int index = 0;
  private String value = "";


  //--------------------------------------
  //  CONSTRUCTOR
  //--------------------------------------

  Cell (int i) {
    this.index = i;
    // expression
  }
  Cell (int i, String str){
    this.index = i;
    this.value = str;
  }
  Cell (String str){
    this.value = str;
  }

  //--------------------------------------
  //  GETTER methods
  //--------------------------------------


  float getFloatValue(){
    return parseFloat(this.value);
  }
  int getIntValue(){
    return parseInt(this.value);
  }
  String getStringValue(){
    return getValue();
  }

  String getValue(){
    return this.value;
  }

  //--------------------------------------
  //  SETTER methods
  //--------------------------------------


  void setFloatValue(float f){
    this.value = str(f);
  }

  void setIntValue(int i){
    this.value = str(i);
  }

  void setStringValue(String str){
    setValue(str);
  }

  void setValue(String str){
    this.value = str;
  }

}