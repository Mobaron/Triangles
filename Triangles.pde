////////////////////////////////////////// Global Parameters
int gradient = 255;

////////////////////////////////////////// Triangle Parameters
int triangleSize = 200;
int triangleInsideIterations = 200;
float triangleInsideDistance = 0.08f;

////////////////////////////////////////// Hexagon Parameters
int hexagonInsideIterations = 200;
float hexagonInsideDistance = 0.08f;


public void setup() {
  noSmooth();
  fullScreen();
  background(0);
  colorMode(HSB);
  noLoop();
}

public void draw() {

  ArrayList<Triangle> triangles = new ArrayList<Triangle>();
  Triangle triInit = new Triangle(triangleSize, triangleInsideIterations, triangleInsideDistance, "bottom"); // Triangle used for fill method.
  triangles = triInit.triangleFill();
  
  Hexagon hexagon1 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  Hexagon hexagon2 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  Hexagon hexagon3 = new Hexagon(triInit.getSize(), hexagonInsideIterations, hexagonInsideDistance);
  hexagon1.setCoordiantesByTriangle(triangles.get(50));
  hexagon2.setCoordiantesByTriangle(triangles.get(60));
  hexagon3.setCoordiantesByTriangle(triangles.get(130));
  hexagon1.draw();
  hexagon2.draw();
  hexagon3.draw();
}
