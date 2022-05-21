class Walker {

  int x;
  int y;
  
  final int destX = DiffAggeration.destX;
  final int destY = DiffAggeration.destY;
  
  ArrayList<PVector> path = new ArrayList<PVector>();
  
  Walker(int x, int y) {
    this.x = x;
    this.y = y;
    
    paths.add(path);
  }
  
  void walk() {
    int random = rand(1,4);
    
    switch (random) {
      case 1:
        y++;
      case 2:
        y--;
      case 3:
        x++;
      case 4:
        x--;
    }
    
    if (x < 0)
      x = width;
    else if (x > width)
      x = 0;
    
    if (y < 0)
      y = height;
    else if (y > height)
      y = 0;
    
    PVector pos = new PVector(x, y);
    
    paths.remove(path);
    path.add(pos);
    paths.add(path);
    
    if (pos.x == this.destX && pos.y == this.destY) {
      walker = new Walker(rand(width), rand(height));
    }
  }
}
