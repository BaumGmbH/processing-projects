final int cols = 50;
final int rows = 50;

final String txtFile = "";
String saveIn = "results-div/";

String num = "";

int completed = 0;
int failed = 0;

int runs = 1;
int mulExpo;

int belowToBeWall = 0;

static int w, h;

Cell[][] grid;

ArrayList<Cell> openSet = new ArrayList<Cell>();
ArrayList<Cell> closedSet = new ArrayList<Cell>();

ArrayList<Cell> path = new ArrayList<Cell>();

Cell start;
Cell end;

Cell current;

void setup() {
  size(600, 600);

  grid = new Cell[cols][rows];
  num = num.isEmpty() ? generatRandomNumberString(2500) : loadStrings(txtFile)[0];

  mulExpo = (runs + 1) * -1;

  w = width  / cols;
  h = height / rows;

  for (int x = 0; x < cols; x++) { 
    for (int y = 0; y < rows; y++) {
      boolean wall = int(""+num.charAt(x + y * rows)) < belowToBeWall;
      grid[x][y] = new Cell(x, y, wall);
    }
  }

  for (int x = 0; x < cols; x++) { 
    for (int y = 0; y < rows; y++) {
      grid[x][y].addNeighbors(grid);
    }
  }

  start = grid[0][0];
  end = grid[cols - 1][rows - 1];

  start.wall = false;
  end.wall = false;

  openSet.add(start);

  for (Cell[] cellArr : grid) {
    for (Cell cell : cellArr) {
      cell.show();
    }
  }
}

void draw() {
  for (int k=0; k<10; k++) {
    if (openSet.size() > 0) {

      int winner = 0;
      for (int i = 0; i < openSet.size(); i++) {
        if (openSet.get(i).f < openSet.get(winner).f) {
          winner = i;
        }
      }

      current = openSet.get(winner);

      if (current.equals(end)) {
        if ((runs != -1 && runs > 0) || runs <= -2) {
          completed++;
          println("Completed | Results >> Total: " + (completed + failed) + " > Completed: " + completed + ", Failed: " + failed + " | Winning % : " + (float(completed) / (completed + failed) + ", Losing %: " + (float(failed) / (completed + failed))));
          drawShape(path, current);
          restart();
          return;
        } else {
          println("Completed");
          drawShape(path, current);
          saveIn = "result_div-"+abs(mulExpo+runs);
          save(saveIn+"/"+belowToBeWall+".png");
          belowToBeWall++;
          noLoop();
          return;
        }
      }

      openSet.remove(current);
      closedSet.add(current);

      ArrayList<Cell> neighbors = current.neighbors;

      for (Cell neighbor : neighbors) {
        if (closedSet.contains(neighbor) || neighbor.wall) continue;

        int tempG = current.g + 1; 

        boolean betterPath = false;

        if (openSet.contains(neighbor)) {
          if (tempG < neighbor.g) {
            neighbor.g = tempG;
            betterPath = true;
          }
        } else {
          neighbor.g = tempG;
          betterPath = true;
          openSet.add(neighbor);
        }

        if (betterPath) {

          neighbor.h = heuristic(neighbor, end);
          neighbor.f = neighbor.g + neighbor.h;

          neighbor.previous = current;
        }
      }
    } else {
      if ((runs != -1 && runs > 0) || runs <= -2) {
        failed++;
        println("No Solution | Results >> Total: " + (completed + failed) + " > Completed: " + completed + ", Failed: " + failed + " | Winning % : " + (float(completed) / (completed + failed) + ", Losing %: " + (float(failed) / (completed + failed))));
        drawShape(path, current);
        restart();
        return;
      } else {
        println("No Solution"); 
        drawShape(path, current);
        saveIn = "result_div-"+abs(mulExpo+runs);
        save(saveIn+"/"+belowToBeWall+".png");
        belowToBeWall++;
        return;
      }
    }

    //background(250);

    /*for (Cell[] cellArr : grid) {
     for (Cell cell : cellArr) {
     cell.show();
     }
     }*/

    /*for (Cell cell : closedSet) {
     //cell.show(250, 0, 0);
     }
     for (Cell cell : openSet) {
     //cell.show(0, 250, 0);
     }*/

    drawShape(path, current);
  }
  //runs--;
  //saveIn = "result_div-"+abs(mulExpo+runs);
  //restart();
  noLoop();
  return;
}

int heuristic(Cell a, Cell b) {
  //return int(dist(a.x,a.y,b.x,b.y)); 
  return abs(a.x - b.x) + abs(a.y - b.y);
}

void drawShape(ArrayList<Cell> path, Cell current) {
  path.clear();
  Cell temp = current;
  path.add(temp);
  while (temp.previous != null) {
    path.add(temp.previous);
    temp = temp.previous;
  }

  noFill();
  strokeWeight(w / 2);
  colorMode(HSB);
  stroke(map(current.x, 0, cols-1, 0, 200), map(current.y, 0, rows -1, 200, 250), 255);
  beginShape();

  for (Cell cell : path) {
    vertex(cell.x * w + w / 2, cell.y * h + h / 2);
  }

  endShape();
}


void restart() {
  save(saveIn+"/"+belowToBeWall+".png");
  belowToBeWall++;
  println("New:"+belowToBeWall);
  if (belowToBeWall>=10) {
    noLoop();
    return;
  }
  background(255);

  for (Cell[] cellArr : grid) {
    for (Cell cell : cellArr) {
      cell.show();
    }
  }

  grid = new Cell[cols][rows];

  openSet.clear();
  closedSet.clear();

  for (int x = 0; x < cols; x++) { 
    for (int y = 0; y < rows; y++) {
      boolean wall = int(""+num.charAt(x + y * rows)) < belowToBeWall;
      grid[x][y] = new Cell(x, y, wall);
    }
  }

  for (int x = 0; x < cols; x++) { 
    for (int y = 0; y < rows; y++) {
      grid[x][y].addNeighbors(grid);
    }
  }

  start = grid[0][0];
  end = grid[cols - 1][rows - 1];

  start.wall = false;
  end.wall = false;

  openSet.add(start);
}

String generatRandomNumberString(int len) {
  String result = "";
  for (int i = 0; i < len; i++) {
    result += random(10);
  }
  return result;
}
