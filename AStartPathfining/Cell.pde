class Cell {

  int x;
  int y;

  int f;
  int g;
  int h;
  
  boolean wall;

  ArrayList<Cell> neighbors = new ArrayList<Cell>();
  
  Cell previous;
  
  Cell(int x, int y, boolean wall) {
    this.x = x;
    this.y = y;

    this.f = 0;
    this.g = 0;
    this.h = 0;
    
    this.wall = wall;
  }

  void addNeighbors(Cell[][] grid) {
    if (x < cols - 1) neighbors.add(grid[x + 1][y]);
    if (x > 0) neighbors.add(grid[x - 1][y]);
    if (y < rows - 1) neighbors.add(grid[x][y + 1]);
    if (y > 0) neighbors.add(grid[x][y - 1]);
    if (x > 0 && y > 0) neighbors.add(grid[x - 1][y - 1]);
    if (x < cols - 1 && y > 0) neighbors.add(grid[x + 1][y - 1]);
    if (x > 0 && y < rows - 1) neighbors.add(grid[x - 1][y + 1]);
    if (x < cols - 1 && y < rows - 1) neighbors.add(grid[x + 1][y + 1]);
  }

  void show() {
    if (!wall) return;
    int w = AStartPathfining.w;
    int h = AStartPathfining.h;

    fill(30);
    noStroke();
    ellipse(x * w + w / 2, y * h + h / 2, w / 2, h / 2);
  }
}
