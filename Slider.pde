class Slider {
  
  // Variables
  int sizeSliderX = 200;
  int sizeSliderY = 20;
  int sizeKnobX = 14;
  int sizeKnobY = 14;

  int xCoordinateSlider = 50;
  int yCoordinateSlider = 50;
  int xCoordinateKnob = 53;
  int yCoordinateKnob = 53;
  
  int mx;
  int my;
  
  ArrayList<Integer> rectAreaX = new ArrayList<Integer>();
  ArrayList<Integer> rectAreaY = new ArrayList<Integer>();
  
  Slider(){}

  void update() {
    if (rectAreaX.contains(mouseX) && rectAreaY.contains(mouseY)){
      drawKnob(mouseX, yCoordinateKnob);
    }
  }

  void draw() {
    createRectArray();
    rect(xCoordinateSlider, yCoordinateSlider, sizeSliderX, sizeSliderY);
    rect(xCoordinateKnob, yCoordinateKnob, sizeKnobX, sizeKnobY); 
  }
  
  void drawKnob(int x, int y) {
    drawContainer();
    rect(x, y, sizeKnobX, sizeKnobY); 
  }
  
  void drawContainer() {
    rect(xCoordinateSlider, yCoordinateSlider, sizeSliderX, sizeSliderY);
  }
  
  void setCoordinates(int x, int y) {
    this.xCoordinateSlider = x;
    this.yCoordinateSlider = y;
    this.xCoordinateKnob = x + 3;
    this.yCoordinateKnob = y + 3;
  }
  
  void createRectArray() {
    for (int i = 0; i < sizeSliderY; i++) {
      for (int o = 0; o < sizeSliderX - 20; o++) {
        rectAreaX.add(o + xCoordinateSlider);
        rectAreaY.add(i + yCoordinateSlider);
      }
    }
  }
}
