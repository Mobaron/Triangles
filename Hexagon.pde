class hexagon {
  
  float[] start_hexagon(int x, int y, int size) {
    float edges[] = new float[12];
    edges[0] = x;
    edges[1] = y;
    edges[2] = x + size;
    edges[3] = y;
    edges[4] = x + 1.5f * size;
    edges[5] = y + sin(degrees(60)) * size;
    edges[6] = x + size;
    edges[7] = y + 2 * sin(degrees(60)) * size;
    edges[8] = x;
    edges[9] = y + 2 * sin(degrees(60)) * size;
    edges[10] = x - 0.5f * size;
    edges[11] = y + sin(degrees(60)) * size;
    
    stroke(gradient, 255, 255);
    line(edges[0], edges[1], edges[2], edges[3]);
    line(edges[2], edges[3], edges[4], edges[5]);
    line(edges[4], edges[5], edges[6], edges[7]);
    line(edges[6], edges[7], edges[8], edges[9]);
    line(edges[8], edges[9], edges[10], edges[11]);
    line(edges[10], edges[11], edges[0], edges[1]);
    
    return edges;
  }

   void draw_inside_hex(float edges[], float distance, int counter) {
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
