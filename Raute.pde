class Rhombus {
  int x1= 0; 
  int y1= 0; //upper edge of rhombus
  int size= triangleSize;
  float distance= triangleInsideDistance;
  int rhomInsideIterations= triangleInsideIterations;
  
  void draw() {
    draw_black_rhom();
    draw_inside_rhom(start_rhom(), distance, 0);
  }
  
  void set_coordinates(int x, int y){
    this.x1 = x;
    this.y1 = y;
  }
  
  void get_size(Triangle parent) {
    this.size = parent.lengthSides;
  }
  
  void set_size(int size) {
    this.size = size;
  }
  
  void draw_black_rhom() { 
    float angle = TWO_PI / 3;
    float radius = size;
    float x2 = x1;
    float y2 = y1 + 0.5 * sin(radians(60)) * size;
    float x3 = x1;
    float y3 = y1 + 1.5 * sin(radians(60)) * size;
    fill(0);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle){
      float sx = x2 + cos(a) * radius;
      float sy = y2 + sin(a) * radius;
      vertex(sx,sy);
    }
    endShape(CLOSE);
    beginShape();            //dieses dreieck muss noch irgendwie gedreht werden
    for (float a = 0; a < TWO_PI; a += angle){
      float sx = x3 + cos(a) * radius;
      float sy = y3 + sin(a) * radius;
      vertex(sx,sy);
    }
    endShape(CLOSE);
    noFill();  
  }
  
  float[] start_rhom() { 
    float edges[] = new float[8];
    edges[0] = x1;
    edges[1] = y1;
    edges[2] = x1 + 0.5 * size;
    edges[3] = y1 + sin(radians(60)) * size;
    edges[4] = x1;
    edges[5] = y1 + 2 * sin(radians(60)) * size;
    edges[6] = x1 - 0.5 * size;
    edges[7] = y1 + sin(radians(60)) * size;
    
    stroke(gradient, 255, 255);
    line(edges[0], edges[1], edges[2], edges[3]);
    line(edges[2], edges[3], edges[4], edges[5]);
    line(edges[4], edges[5], edges[6], edges[7]);
    line(edges[6], edges[7], edges[0], edges[1]);
    
    return edges;
  }
  

   void draw_inside_rhom(float edges[], float distance, int iterations) { //für rhom
    iterations = iterations + 1;
    float new_edges[] = new float[12];
    new_edges[0] = edges[2] + (edges[4] - edges[2]) * distance;
    new_edges[1] = edges[3] + (edges[5] - edges[3]) * distance;
    new_edges[2] = edges[4] + (edges[6] - edges[4]) * distance;
    new_edges[3] = edges[5] + (edges[7] - edges[5]) * distance;
    new_edges[4] = edges[6] + (edges[0] - edges[6]) * distance;
    new_edges[5] = edges[7] + (edges[1] - edges[7]) * distance;
    new_edges[6] = edges[0] + (new_edges[0] - edges[0]) * distance;
    new_edges[7] = edges[1] + (new_edges[1] - edges[1]) * distance;
  
    
    stroke(gradient, 255, 255);
    line(edges[0], edges[1], new_edges[0], new_edges[1]);
    line(new_edges[0], new_edges[1], new_edges[2], new_edges[3]);
    line(new_edges[2], new_edges[3], new_edges[4], new_edges[5]);
    line(new_edges[4], new_edges[5], new_edges[6], new_edges[7]);
    line(new_edges[6], new_edges[7], new_edges[8], new_edges[9]);
    line(new_edges[8], new_edges[9], new_edges[10], new_edges[11]);
    
    
    if (gradient >= 255) gradient=0; else gradient = iterations * 2;
    if (iterations < rhomInsideIterations) {
      draw_inside_rhom(new_edges, distance, iterations);
    }
  } 
}

//Inneres von Raute und Hexagon = backgroundcolor
