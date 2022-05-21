static float getYValue(float x) {
  // y = mx + c
  return 0.89 * x - 0.1;
}

class Point {

  float x;
  float y;
  
  float bias = 1;
  
  int label;

  Point() {
    x = random(-1, 1);
    y = random(-1, 1);
    
    label = y > getYValue(x) ? 1 : -1;
  }
  
  Point(float x, float y) {
    this();
    
    this.x = x;
    this.y = y;
  }
  
  float pixelX() {
    return map(x, -1, 1, 0, width);
  }
  
  float pixelY() {
    return map(y, -1, 1, height, 0); 
  }
  
  void show() {
    stroke(0);
    fill(label == -1 ? 0 : 255);
    
    float pointX = pixelX();
    float pointY = pixelY();
    
    ellipse(pointX, pointY, 8, 8);
  }
}
