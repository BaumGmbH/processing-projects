class Triangle {

  int x;
  int y;
  int w;
  int h;

  boolean splitted;

  Triangle[] childs = new Triangle[3];

  Triangle(int x, int y, int w, int h, int splits) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    if (splits > 0) {
      split(splits);
      
    }
  }

  void split(int splits) {
    childs[0] = new Triangle(x - w / 4, y + h / 4, w / 2, h / 2, splits - 1);
    childs[1] = new Triangle(x + w / 4, y + h / 4, w / 2, h / 2, splits - 1);
    childs[2] = new Triangle(x, y - h / 4, w / 2, h / 2, splits - 1);
    
    splitted = true;
  }

  void show() {
    if (!splitted) {
      noFill();
      stroke(0);
      strokeWeight(1);
      triangle((x - w / 2) - zoom, (y + h / 2) + zoom, (x + w / 2) + zoom, (y + h / 2) + zoom, x, (y - h / 2) - zoom);
    } else {
      childs[0].show();
      childs[1].show();
      childs[2].show();
    }
  }
}
