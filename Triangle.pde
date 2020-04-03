class Triangle {

    float x1;
    float y1;
    float x2;
    float y2;
    float x3;
    float y3;
    float inside_distance;
    int length_sides;
    int counter_iterations;
    int iterations = 0;
    String orientation;

  Triangle(String rotation) {
    // rotation accepted parameters: top, left, right, bottom;
    this.x1 = 0;
    this.y1 = 0;
    this.length_sides = size_triangle;
    this.orientation = rotation;
    this.inside_distance = distance_param;
    this.counter_iterations = iteration_param;
  }
  
  void draw(){
    start_triangle();
    draw_inside(x1, y1, x2, y2, x3, y3);
  }
  
  void location(Triangle parent, String position){
    String parent_rotation = parent.get_orientation();
    
    if (parent_rotation == "bottom") {
      if (orientation == "top") {
        if (position == "right"){
          this.x1 = parent.get_x3();
          this.y1 = parent.get_y3();
        } else if (position == "left"){
          this.x1 = parent.get_x3() - this.length_sides;
          this.y1 = parent.get_y3();
        } else if (position == "top"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1();
        } else if (position == "bottom"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() + parent.get_h() * 2;
        }
      }
    }
    
    if (parent_rotation == "bottom") {
      if (orientation == "bottom") {
        if (position == "right"){
          this.x1 = parent.get_x2();
          this.y1 = parent.get_y2();
        } else if (position == "left"){
          this.x1 = parent.get_x1() - this.length_sides;
          this.y1 = parent.get_y1();
        } else if (position == "top"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() - parent.get_h();
        } else if (position == "bottom"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() + parent.get_h();
        }
      }
    }

    if (parent_rotation == "top") {
      if (orientation == "bottom") {
        if (position == "right"){
          this.x1 = parent.get_x3();
          this.y1 = parent.get_y3();
        } else if (position == "left"){
          this.x1 = parent.get_x3() - this.length_sides;
          this.y1 = parent.get_y3();
        } else if (position == "top"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() - parent.get_h() * 2;
        } else if (position == "bottom"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1();
        }
      }
    }

    if (parent_rotation == "top") {
      if (orientation == "top") {
        if (position == "right"){
          this.x1 = parent.get_x2();
          this.y1 = parent.get_y2();
        } else if (position == "left"){
          this.x1 = parent.get_x1() - this.length_sides;
          this.y1 = parent.get_y1();
        } else if (position == "top"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() - parent.get_h();
        } else if (position == "bottom"){
          this.x1 = parent.get_x1();
          this.y1 = parent.get_y1() + parent.get_h();
        }
      }
    }
  }

  void set_coordinates(int x, int y) {
    this.x1 = x;
    this.y1 = y;
  }
  
  void set_orientation(String ori) {
    this.orientation = ori;
  }

  float get_x1() {
    return x1;
  }
  
  float get_x2() {
    return x2;
  }
  
  float get_x3() {
    return x3;
  }
  
  float get_y1() {
    return y1;
  }
  
  float get_y2() {
    return y2;
  }
  
  float get_y3() {
    return y3;
  }
  
  String get_orientation() {
    return orientation;
  }
  
  void start_triangle() {
    // Add left and right later.
    if (orientation == "top") {
      y3 = y1 - sin(radians(60)) * length_sides;
    } else if (orientation == "bottom") {
      y3 = y1 + sin(radians(60)) * length_sides;
    }
    x3 = PApplet.parseInt(x1 + (0.5f*length_sides));
    
    x2 = x1 + length_sides;
    y2 = y1;
    
    stroke(gradient, 255, 255);
    line(x1, y1, x2, y2);
    line(x2, y2, x3, y3);
    line(x3, y3, x1, y1);
  }
  
  float get_h() {
   float h = ((sqrt(3)) * (length_sides / 2));
   return h;
  }
  
  void draw_inside(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    iterations = iterations + 1;
    float _x4 = _x2 + (_x3 - _x2) * inside_distance;
    float _y4 = _y2 + (_y3 - _y2) * inside_distance;
    float _x5 = _x3 + (_x1 - _x3) * inside_distance;
    float _y5 = _y3 + (_y1 - _y3) * inside_distance;
    float _x6 = _x1 + (_x4 - _x1) * inside_distance;
    float _y6 = _y1 + (_y4 - _y1) * inside_distance;
   
    stroke(gradient, 255, 255);
    line(int(_x1), int(_y1), int(_x4), int(_y4));
    line(int(_x4), int(_y4), int(_x5), int(_y5));
    line(int(_x5), int(_y5), int(_x6), int(_y6));
    
    if (gradient >= 255) gradient=0; else gradient=iterations*10;
    if (iterations < counter_iterations) {
      draw_inside(_x4, _y4, _x5, _y5, _x6, _y6);
    }
  }
}
