class Triangle {

    float x1;
    float y1;
    float x2;
    float y2;
    float x3;
    float y3;
    float insideDistance;
    int row;
    int lengthSides;
    int counterIterations;
    int iterations = 0;
    String orientation;

  /**
   * Triangle Constructor.
   * @param length_sides         Length of the triangle sides.
   * @param counter_iterations   Counter of how many inside lines will be drawn.
   * @param inside_distance      Distance between inside lines.
   */
  Triangle(int lengthSides, int counterIterations, float insideDistance, String rotation) {
    // rotation accepted parameters: top, left, right, bottom;
    this.x1 = 0;
    this.y1 = 0;
    this.lengthSides = lengthSides;
    this.orientation = rotation;
    this.insideDistance = insideDistance;
    this.counterIterations = counterIterations;
  }
  
  void draw(){
    startTriangle();
    drawInside(x1, y1, x2, y2, x3, y3);
  }
  
  void location(Triangle parent, String position){
    String parentRotation = parent.getOrientation();
    
    if (parentRotation == "bottom") {
      if (orientation == "top") {
        if (position == "right"){
          this.x1 = parent.getX3();
          this.y1 = parent.getY3();
        } else if (position == "left"){
          this.x1 = parent.getX3() - this.lengthSides;
          this.y1 = parent.getY3();
        } else if (position == "top"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1();
        } else if (position == "bottom"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() + parent.get_h() * 2;
        }
      }
    }
    
    if (parentRotation == "bottom") {
      if (orientation == "bottom") {
        if (position == "right"){
          this.x1 = parent.getX2();
          this.y1 = parent.getY2();
        } else if (position == "left"){
          this.x1 = parent.getX1() - this.lengthSides;
          this.y1 = parent.getY1();
        } else if (position == "top"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() - parent.get_h();
        } else if (position == "bottom"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() + parent.get_h();
        }
      }
    }

    if (parentRotation == "top") {
      if (orientation == "bottom") {
        if (position == "right"){
          this.x1 = parent.getX3();
          this.y1 = parent.getY3();
        } else if (position == "left"){
          this.x1 = parent.getX3() - this.lengthSides;
          this.y1 = parent.getY3();
        } else if (position == "top"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() - parent.get_h() * 2;
        } else if (position == "bottom"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1();
        }
      }
    }

    if (parentRotation == "top") {
      if (orientation == "top") {
        if (position == "right"){
          this.x1 = parent.getX2();
          this.y1 = parent.getY2();
        } else if (position == "left"){
          this.x1 = parent.getX1() - this.lengthSides;
          this.y1 = parent.getY1();
        } else if (position == "top"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() - parent.get_h();
        } else if (position == "bottom"){
          this.x1 = parent.getX1();
          this.y1 = parent.getY1() + parent.get_h();
        }
      }
    }
  }

  void setCoordinates(int x, int y) {
    this.x1 = x;
    this.y1 = y;
  }
  
  void setOrientation(String ori) {
    this.orientation = ori;
  }
  
  void setRow(int row) {
    this.row = row;
  }

  float getX1() {
    return x1;
  }
  
  float getX2() {
    return x2;
  }
  
  float getX3() {
    return x3;
  }
  
  float getY1() {
    return y1;
  }
  
  float getY2() {
    return y2;
  }
  
  float getY3() {
    return y3;
  }
  
  int getSize() {
    return lengthSides;
  }
  
  String getOrientation() {
    return orientation;
  }
  
  void startTriangle() {
    // Add left and right later.
    if (orientation == "top") {
      y3 = y1 - sin(radians(60)) * lengthSides;
    } else if (orientation == "bottom") {
      y3 = y1 + sin(radians(60)) * lengthSides;
    }
    x3 = PApplet.parseInt(x1 + (0.5f*lengthSides));
    
    x2 = x1 + lengthSides;
    y2 = y1;
    
    stroke(gradient, 255, 255);
    line(x1, y1, x2, y2);
    line(x2, y2, x3, y3);
    line(x3, y3, x1, y1);
  }
  
  float get_h() {
   float h = ((sqrt(3)) * (lengthSides / 2));
   return h;
  }
  
  void drawInside(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    iterations = iterations + 1;
    float _x4 = _x2 + (_x3 - _x2) * insideDistance;
    float _y4 = _y2 + (_y3 - _y2) * insideDistance;
    float _x5 = _x3 + (_x1 - _x3) * insideDistance;
    float _y5 = _y3 + (_y1 - _y3) * insideDistance;
    float _x6 = _x1 + (_x4 - _x1) * insideDistance;
    float _y6 = _y1 + (_y4 - _y1) * insideDistance;
   
    stroke(gradient, 255, 255);
    line(int(_x1), int(_y1), int(_x4), int(_y4));
    line(int(_x4), int(_y4), int(_x5), int(_y5));
    line(int(_x5), int(_y5), int(_x6), int(_y6));
    
    if (gradient >= 255) gradient=0; else gradient=iterations*10;
    if (iterations < counterIterations) {
      drawInside(_x4, _y4, _x5, _y5, _x6, _y6);
    }
  }
  
  /**
   * Fill an Image with Triangles
   *
   * @return ArrayList
   */
  ArrayList<Triangle> triangleFill() {

    ArrayList<Triangle> triangles = new ArrayList<Triangle>();
    int rows = 0;
    int counter = 0;
    int lastY;
    int shift = int(-0.5 * triangleSize); // Triangles will start out of frame to fill the whole screen
    boolean screenFilled = false;

      while (!screenFilled) {
  
      triangles.add(new Triangle(lengthSides, counterIterations, insideDistance, "bottom"));
      Triangle currentTriangle = triangles.get(counter);

      if (counter == 0) {  // First Element in ArrayList
        currentTriangle.setCoordinates(shift, 0); //first triangle starts out of frame to fill the whole screen
        currentTriangle.draw();
        rows++;
      } else {             // Other Elements
        Triangle lastTriangle = triangles.get(counter - 1);
        float xCoordinate = lastTriangle.getX2();
        String lastTriangleOrientation = lastTriangle.getOrientation();
        if (xCoordinate > (width + lengthSides)) { // If x2 coordinate of current triangle exeeds boundaries start a new line of triangles.
          rows = rows + 1;
          if (isEven(rows)){
            shift = - triangleSize;
          } else {
            shift = int(-0.5 * triangleSize);
          }
          if (lastTriangleOrientation == "top") {
            lastY = int(lastTriangle.getY3());
          } else {
            lastY = int(lastTriangle.getY1());
          }
          currentTriangle.setCoordinates(shift, int(lastY + (lastTriangle.get_h())));
          currentTriangle.draw();
        } else {
          if (lastTriangleOrientation == "bottom") {
            currentTriangle.setOrientation("top");
          }
          currentTriangle.location(lastTriangle, "right");
          currentTriangle.draw();
        }
      }
      if ((currentTriangle.getY1() - currentTriangle.get_h()) > height || (currentTriangle.getY3() - currentTriangle.get_h()) > height) {
        screenFilled = true;
      }
      currentTriangle.setRow(rows);
      counter++;
    }
    return triangles;
  }
  
  boolean isEven(int n) {
    return (n % 2) == 0;
  }
}

//Ideen: set_edges Funktion einbauen um nicht-gleichseitige Dreiecke zu realisieren
// mirror Funktion einbauen, damit auch mit gespiegelten Dreieicken gearbeitet werden kann
