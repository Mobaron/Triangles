/////////////////////////////////////////////////////////////
int window_x = 2560;
int gradient = 255;
int size_triangle = 180;
int iteration_param = 200;
float distance_param = 0.08f;
/////////////////////////////////////////////////////////////

ArrayList<Triangle> triangles = new ArrayList<Triangle>();


public void setup() {
  size(2560, 1440);
  //noSmooth();
  background(0);
  colorMode(HSB);
}

public void draw() {

  int counter = 0;
  int l_y;
  
  while (counter < 300) {
    
    triangles.add(new Triangle("bottom"));
    Triangle c_triangle = triangles.get(counter);
    
    if (counter == 0) { // First Element in ArrayList
      c_triangle.draw();
    } else { // Other Elements
      Triangle l_triangle = triangles.get(counter - 1);
      float x_coordinate = l_triangle.get_x2();
      String l_orientation = l_triangle.get_orientation();
      if (x_coordinate > window_x) { // If x2 coordinate of current triangle exeeds boundaries start a new line of triangles.
        if (l_orientation == "top") {
          c_triangle.set_orientation("bottom");
          l_y = int(l_triangle.get_y3());
        } else {
          l_y = int(l_triangle.get_y1());
        }
        c_triangle.set_coordinates(0, int(l_y + (l_triangle.get_h()))); //Use this line when .get_h method actually works.
        c_triangle.draw();
      } else {
        if (l_orientation == "bottom") {
          c_triangle.set_orientation("top");
        }
        c_triangle.location(l_triangle, "right");
        c_triangle.draw();
      }
    }
    counter++;
  }
}
