class Hexagon {
  
  int x1 = 0;
  int y1 = 0;
  int size;
  int iterations;
  int counter = 0;
  float distance;
  
  Hexagon(int size, int iterations, float distance){
    this.size = size;
    this.distance = distance;
    this.iterations = iterations;
  } 
  
  void draw() {
    drawBlackHex();
    drawInsideHex(startHex());
  }
  
  void setCoordinatesByTriangle(Triangle triangle) {
    x1 = int(triangle.getX2());
    y1 = int(triangle.getY2());
  }
  
  void setCoordinates(int x, int y){
    this.x1 = x;
    this.y1 = y;
  }
  
  void getSize(Triangle parent) {
    this.size = parent.lengthSides;
  }
  
  void setSize(int size) {
    this.size = size;
  }
  
  void drawBlackHex() {
    
    float edges[] = startHex();
    fill(backgroundColor);
    beginShape();
    vertex(edges[0], edges[1]);
    vertex(edges[2], edges[3]);
    vertex(edges[4], edges[5]);
    vertex(edges[6], edges[7]);
    vertex(edges[8], edges[9]);
    vertex(edges[10], edges[11]);

    endShape(CLOSE);
    noFill();
  }
  
  float[] startHex() {
    float edges[] = new float[12];
    edges[0] = x1;
    edges[1] = y1;
    edges[2] = x1 + size;
    edges[3] = y1;
    edges[4] = x1 + 1.5f * size;
    edges[5] = y1 + sin(radians(60)) * size;
    edges[6] = x1 + size;
    edges[7] = y1 + 2 * sin(radians(60)) * size;
    edges[8] = x1;
    edges[9] = y1 + 2 * sin(radians(60)) * size;
    edges[10] = x1 - 0.5f * size;
    edges[11] = y1 + sin(radians(60)) * size;
    
    stroke(gradient, 255, 255);
    line(edges[0], edges[1], edges[2], edges[3]);
    line(edges[2], edges[3], edges[4], edges[5]);
    line(edges[4], edges[5], edges[6], edges[7]);
    line(edges[6], edges[7], edges[8], edges[9]);
    line(edges[8], edges[9], edges[10], edges[11]);
    line(edges[10], edges[11], edges[0], edges[1]);
    
    return edges;
  }
  
   void drawInsideHex(float edges[]){
    float newEdges[] = new float[12];
    newEdges[0] = edges[2] + (edges[4] - edges[2]) * distance;
    newEdges[1] = edges[3] + (edges[5] - edges[3]) * distance;
    newEdges[2] = edges[4] + (edges[6] - edges[4]) * distance;
    newEdges[3] = edges[5] + (edges[7] - edges[5]) * distance;
    newEdges[4] = edges[6] + (edges[8] - edges[6]) * distance;
    newEdges[5] = edges[7] + (edges[9] - edges[7]) * distance;
    newEdges[6] = edges[8] + (edges[10] - edges[8]) * distance;
    newEdges[7] = edges[9] + (edges[11] - edges[9]) * distance;
    newEdges[8] = edges[10] + (edges[0] - edges[10]) * distance;
    newEdges[9] = edges[11] + (edges[1] - edges[11]) * distance;
    newEdges[10] = edges[0] + (newEdges[0] - edges[0]) * distance;
    newEdges[11] = edges[1] + (newEdges[1] - edges[1]) * distance;

    stroke(gradient, 255, 255);
    line(edges[0], edges[1], newEdges[0], newEdges[1]);
    line(newEdges[0], newEdges[1], newEdges[2], newEdges[3]);
    line(newEdges[2], newEdges[3], newEdges[4], newEdges[5]);
    line(newEdges[4], newEdges[5], newEdges[6], newEdges[7]);
    line(newEdges[6], newEdges[7], newEdges[8], newEdges[9]);
    line(newEdges[8], newEdges[9], newEdges[10], newEdges[11]);
    
    this.counter++;
    if (gradient >= 255) gradient=0; else gradient=iterations*10;
    if (this.counter < this.iterations) {
      drawInsideHex(newEdges);
    }
  } 
}
