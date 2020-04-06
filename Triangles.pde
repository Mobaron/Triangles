/////////////////////////////////////////////////////////////
int window_x = 2560;
int gradient = 255;
int size_triangle = 200;
int iteration_param = 200;
float distance_param = 0.08f;
/////////////////////////////////////////////////////////////

ArrayList<Hexagon> hexagons = new ArrayList<Hexagon>();

public void setup() {
  size(2560, 1440);
  //noSmooth();
  background(0);
  colorMode(HSB);
}

public void draw() {
  
  //triangleFill();
  //translate(250, 250);
  //hexagons.add(new Hexagon());
  //Hexagon c_hexagon = hexagons.get(counter); //current triangle
  //c_hexagon.set_coordinates(2 * size_triangle, int(sin(radians(60)) * size_triangle)); 
  //c_hexagon.set_size(2 * size_triangle);
  //      c_hexagon.draw();
  //Hexagon hexagon;
  //hexagon = hexagons.get(0);
  //hexagon.draw();
  ArrayList<Triangle> triangles = new ArrayList<Triangle>();
  Triangle tri_init = new Triangle(size_triangle, iteration_param, distance_param, "bottom");
  tri_init.triangleFill(100);
}


static final boolean isEven(int n) {
  return (n % 2) == 0;
}
