class CircleLine {

  int x;
  int y;

  int endX;
  int endY;

  int len;
  int level;

  float speed;

  float angle;

  CircleLine child;
  CircleLine parent;

  CircleLine(int x, int y, int len, int levels, float speed, CircleLine parent) {
    this.x = x;
    this.y = y;

    this.len = len;
    this.level = levels;
    this.speed = speed;

    this.parent = parent;

    if (level > 1) {
      endX = floor(len * cos(angle));
      endY = floor(len * sin(angle));

      child = new CircleLine(endX, endY, len / 2, level - 1, speed * 2, this);
    }
  }

  void update() {
    angle += (PI / 180 * (0.1 * speed)) % TWO_PI;

    if (parent != null) {
      x = parent.endX;
      y = parent.endY;
    }
    if (child != null) {
      child.update();
    }
  }

  void show() {

    endX = floor(x + len * cos(angle));
    endY = floor(y + len * sin(angle));

    colorMode(HSB);
    //stroke(map(angle % 20, 0, 20, 0, 255), 255, 255);
    stroke(map(level, 1, MultiCircle.levels, 0, 180), 255, 255);
    strokeWeight(3);

    //line(x, y, endX, endY);

    //point(endX, endY);

    if (child != null) {    
      child.show();
    } else
      point(endX, endY);
  }
}
