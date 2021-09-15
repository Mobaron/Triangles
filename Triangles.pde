////////////////////////////////////////// Global Parameters
int gradient = 255;
int backgroundColor = 0;

////////////////////////////////////////// Triangle Parameters
int triangleSize = 200;
int triangleInsideIterations = 200;
float triangleInsideDistance = 0.08f;

////////////////////////////////////////// Hexagon Parameters
int hexagonInsideIterations = 200;
float hexagonInsideDistance = 0.08f;

//////////////////////////////////////////
ArrayList<Triangle> triangles = new ArrayList<Triangle>();
Triangle objTriangle = new Triangle();
UI ui = new UI();
Slider slider = new Slider();

public void setup() {
  noSmooth();
  fullScreen();
  background(backgroundColor);
  colorMode(HSB);
  run();
}

public void draw() {
}

void run(){
  ArrayList<Triangle> triangles = new ArrayList<Triangle>();
  Triangle triInit = new Triangle(triangleSize, triangleInsideIterations, triangleInsideDistance, "bottom"); // Triangle used for fill method.
  triangles = triInit.triangleFill();
  
  //Hexagon hexagon1 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  //Hexagon hexagon2 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  //Hexagon hexagon3 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  //hexagon1.setCoordinatesByTriangle(triangles.get(50));
  //hexagon2.setCoordinatesByTriangle(triangles.get(60));
  //hexagon3.setCoordinatesByTriangle(triangles.get(130));
  //hexagon1.draw();
  //hexagon2.draw();
  //hexagon3.draw();
  
  //Rhombus rhombus1 = new Rhombus();
  //Rhombus rhombus2 = new Rhombus();
  //Rhombus rhombus3 = new Rhombus();
  //Rhombus rhombus4 = new Rhombus();
  Rhombus rhombus5 = new Rhombus();
  //rhombus1.setCoordinatesByTriangle(triangles.get(0));
  //rhombus2.setCoordinatesByTriangle(triangles.get(1));
  //rhombus3.setCoordinatesByTriangle(triangles.get(2));
  //rhombus4.setCoordinatesByTriangle(triangles.get(3));
  rhombus5.setCoordinatesByTriangle(triangles.get(4));
  //rhombus1.setMirror(true);
  //rhombus3.setMirror(true);
  //rhombus5.setMirror(true);
  //rhombus1.draw();
  //rhombus2.draw();
  //rhombus3.draw();
  //rhombus4.draw();
  rhombus5.draw();
}
