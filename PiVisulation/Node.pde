public class Node {

  public int x;
  public int y;

  public int didgit;

  public boolean[][] connections = new boolean[3][3];

  public Node(int x, int y, int didgit) {
    this.x = x + 1;
    this.y = y + 1;

    this.didgit = didgit;
  }

  public void connect() {
    println("NEW");
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        if (x + i > w || x + 1 < 0 || y + j > h || y + j < 0) continue;
        println("Run: " + i,j, "Connection: " + connections[i + 1][j + 1], "Node: " + nodes[x + i][y + j]);
        connections[i + 1][j + 1] = (nodes[x + i][y + j].didgit == didgit);
        //println(nodes[x+i][y+j]);
      }
    }
  }

  public void show() {
    int xPos = x * spacing;
    int yPos = y * spacing;

    noStroke();
    switch (didgit) {
    case 0: 
      fill(255); 
      break;
    case 1: 
      fill(237, 39, 21); 
      break;
    case 2: 
      fill(237, 39, 21); 
      break;
    case 3: 
      fill(136, 21, 237); 
      break;
    case 4: 
      fill(136, 21, 237); 
      break;
    case 5: 
      fill(234, 237, 21); 
      break;
    case 6: 
      fill(237, 21, 97); 
      break;
    case 7: 
      fill(21, 172, 237); 
      break;
    case 8: 
      fill(47, 12, 145); 
      break;
    case 9: 
      fill(145, 12, 58); 
      break;
    }

    ellipse(xPos, yPos, 10, 10);
    
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        if (x + i > w || x + i < 0 || y + j > h || y + j < 0) continue;
        boolean b = connections[i + 1][j + 1];
        println(b);
        if (!b) continue;
        stroke(100);
        println("Draw: " + xPos, yPos, xPos + (spacing * i), yPos + (spacing * j));
        line(xPos, yPos, xPos + (spacing * i), yPos + (spacing * j));
      }
    }
  }
}
