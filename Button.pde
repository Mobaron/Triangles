class Button { // Button Helper Class
  int size = 10;
  int x = 0;
  int y = 0;
  
  Button(){}
  
  Button(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  int getX() {
    return this.x;
  }
  
  int getY() {
    return this.y;
  }
  
  int getSize() {
    return this.size;
  }
  
  void setSize(int size) {
    this.size = size;
  }
  
  void setCoordinates(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    ellipse(x, y, size, size);
  }
}
