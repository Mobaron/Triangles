class UI{
  
  int circleSize = 10;
  boolean overCircle = false;
  
  ArrayList<Button> buttons = new ArrayList<Button>();
  ArrayList<Triangle> triangles = new ArrayList<Triangle>();
  
  UI() {}
  
  UI(int circleSize) {
    this.circleSize = circleSize;
  }
  
  void guidelineGrid() {
    int xCoordinate = 0;
    int yCoordinate = 0;
    
    Button currentButton;
    boolean screenFilled = false;

    while (!screenFilled){
      buttons.add(new Button());
      currentButton = buttons.get(buttons.size() - 1);
      currentButton.setCoordinates(xCoordinate, yCoordinate);
      currentButton.draw();
      xCoordinate = xCoordinate + triangles.get(triangles.size() - 1).getSize() / 2;
      if (xCoordinate > width) {
        xCoordinate = 0;
        yCoordinate = int(yCoordinate + triangles.get(triangles.size() - 1).getH());
      } else if (yCoordinate > height) {
        screenFilled = true;
      }
    }
  }
  
  void update(){
    int x;
    int y;
    Triangle currentTriangle;
    for (Button button : buttons){
      if (overCircle(button)){
        if (mousePressed) {
          x = button.getX();
          y = button.getY();
          triangles.add(new Triangle());
          currentTriangle = triangles.get(triangles.size() - 1);
          currentTriangle.setCoordinates(x, y);
          currentTriangle.draw();
        }
      }
    }
  }
  
  void setFirstTriangle(Triangle triangle) { // Add try catch with nullpointer exception later in UI later.
    triangles.add(triangle);
  }
  
  boolean overCircle(Button button) {
    int x = button.getX();
    int y = button.getY();
    int diameter = button.getSize();
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
