/////////////////////////////////////////////////////////////
int window_x = 2560;
int gradient = 255;
int size_triangle = 200;
int iteration_param = 200;
float distance_param = 0.08f;
/////////////////////////////////////////////////////////////

ArrayList<Triangle> triangles = new ArrayList<Triangle>();
ArrayList<Hexagon> hexagons = new ArrayList<Hexagon>();



public void setup() {
  size(2560, 1440);
  //noSmooth();
  background(0);
  colorMode(HSB);
}

public void draw() {

  int counter = 0;
  int l_y;
  int rows = 0;
  int shift = int(-0.5 * size_triangle); //triangles will start out of frame to fill the whole screen
  
  hexagons.add(new Hexagon());
  Hexagon c_hexagon = hexagons.get(counter); //current triangle
  c_hexagon.set_coordinates(2 * size_triangle, int(sin(radians(60)) * size_triangle)); 
  c_hexagon.set_size(2 * size_triangle);
        c_hexagon.draw();
  
  while (counter < 300) {
    
    triangles.add(new Triangle("bottom"));
    Triangle c_triangle = triangles.get(counter); //current triangle
    
    if (counter == 0) { // First Element in ArrayList
      c_triangle.set_coordinates(shift, 0); //first triangle starts out of frame to fill the whole screen
      c_triangle.draw();
      rows = rows + 1;
    } else { // Other Elements
      Triangle l_triangle = triangles.get(counter - 1); //last triangle
      float x_coordinate = l_triangle.get_x2();
      String l_orientation = l_triangle.get_orientation();
      if (x_coordinate > window_x) { // If x2 coordinate of current triangle exeeds boundaries start a new row of triangles.
        rows = rows + 1;
        if (isEven(rows)){
            shift = - size_triangle;
          } else {
            shift = int(-0.5 * size_triangle);
          }
        if (l_orientation == "top") {
          //c_triangle.set_orientation("bottom"); //Was macht das?
          l_y = int(l_triangle.get_y3());
        } else {
          l_y = int(l_triangle.get_y1());
        }
        c_triangle.set_coordinates(shift, int(l_y + (l_triangle.get_h()))); //next row start under last row and every even row is shifted by 1/2 size
        c_triangle.draw();
      } else { //continue current row
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

static final boolean isEven(int n) {
  return (n % 2) == 0;
}
