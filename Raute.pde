class Rhombus {
  int x1= 0;
  int y1= 0;
  int size= size_triangle;
  float distance= distance_param;
  
  void draw() {
    draw_black_rhom();
    draw_inside_rhom(start_rhom(), distance);
  }
  
  void set_coordinates(int x, int y){
    this.x1 = x;
    this.y1 = y;
  }
  
  void get_size(Triangle parent) {
    this.size = parent.length_sides;
  }
  
  void set_size(int size) {
    this.size = size;
  }
  
  void draw_black_rhom() { //aus zwei dreiecken zusammenbauen
    float angle = TWO_PI / 6;
    float radius = size;
    float x = x1 + 0.5 * size;
    float y = y1 + sin(radians(60)) * size;
    fill(0);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle){
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx,sy);
    }
    endShape(CLOSE);
    noFill();  
  }
  
  float[] start_rhom() { //für rhom machen
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
  

   void draw_inside_rhom(float edges[], float distance){//, int counter) { //für rhom
    //iterations = iterations + 1;
    float new_edges[] = new float[12];
    new_edges[0] = edges[2] + (edges[4] - edges[2]) * distance;
    new_edges[1] = edges[3] + (edges[5] - edges[3]) * distance;
    new_edges[2] = edges[4] + (edges[6] - edges[4]) * distance;
    new_edges[3] = edges[5] + (edges[7] - edges[5]) * distance;
    new_edges[4] = edges[6] + (edges[8] - edges[6]) * distance;
    new_edges[5] = edges[7] + (edges[9] - edges[7]) * distance;
    new_edges[6] = edges[8] + (edges[10] - edges[8]) * distance;
    new_edges[7] = edges[9] + (edges[11] - edges[9]) * distance;
    new_edges[8] = edges[10] + (edges[0] - edges[10]) * distance;
    new_edges[9] = edges[11] + (edges[1] - edges[11]) * distance;
    new_edges[10] = edges[0] + (new_edges[0] - edges[0]) * distance;
    new_edges[11] = edges[1] + (new_edges[1] - edges[1]) * distance;
  
    
    stroke(gradient, 255, 255);
    line(edges[0], edges[1], new_edges[0], new_edges[1]);
    line(new_edges[0], new_edges[1], new_edges[2], new_edges[3]);
    line(new_edges[2], new_edges[3], new_edges[4], new_edges[5]);
    line(new_edges[4], new_edges[5], new_edges[6], new_edges[7]);
    line(new_edges[6], new_edges[7], new_edges[8], new_edges[9]);
    line(new_edges[8], new_edges[9], new_edges[10], new_edges[11]);
    
    
    //if (gradient >= 255) gradient=0; else gradient=iterations*2;
    //if (iterations < counter) {
    //  draw_inside_hex(new_edges, distance_param, counter);
    //}
  } 
}
